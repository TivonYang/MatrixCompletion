function X0 = generate_data(n, k)
    %% generating data: sparse vector a
    a1 = randn(k, 1); %normally distributed data
    ap = round((n-1).*rand(k, 1) + 1); %normally distributed locations for nonzero values in the sparse vector
    o = ones(k, 1);
    a = sparse(ap, o, a1, n, 1); 

    %% generating data: sparse vector b
    b1 = randn(k, 1);
    bp = round((n-1).*rand(k, 1) + 1); 
    b = sparse(bp, o, b1, n, 1); 

    %% creating the rank 1 sparse normalized data matrix X0
    X0_1 = a*b'; %rank 1
    X0 = X0_1/norm(X0_1, 'fro'); %normalize 
end