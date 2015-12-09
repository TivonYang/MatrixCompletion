function  Empirical_MSE_Raw = nonconvex_algorithm(Y, n, k, Gamma, X0)

%% STEP 1: Sort the columns and rows of Y by 2-norm, and keep only first k cols/rows, zeroing out everything else
%% Get 2-norms of columns
    col_norm = zeros(n, 1); 
    for i = 1:n
        col_norm(i) = norm(Y(:, i)); 
    end
    
    %% sort column norms
    [~, sorted_col_norm_idx] = sort(col_norm, 'descend'); 
    
    %% get row norms
    row_norm  = zeros(n, 1);
    for i = 1:n
        row_norm(i) = norm(Y(i, :)); 
    end
    
    %% sort row norms
    [~, sorted_row_norm_idx] = sort(row_norm, 'descend'); 
    
    %% keep only top k column/row norms
    for i = k+1:n
       Y(:, sorted_col_norm_idx(i)) = 0;  
       Y(sorted_row_norm_idx(i), :) = 0;
    end
    
    %% STEP 2
    %% solve the singular value soft thresholding problem using CVX
    cvx_begin quiet
        variable X(n, n)
        minimize(0.5*square_pos(norm( Y - X , 'fro')) + 2.01*sqrt(k)*norm_nuc(X))
    cvx_end
          
    %% Obtain MSE (raw)
    Err = X - Gamma*X0;
    Empirical_MSE_Raw = sum(Err(:).^2); 

end