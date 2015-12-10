function Empirical_MSE_Vec = noisy_est_sim_str_convex()
    %% Set initial parameters
    [n, k_vals, Gamma, Empirical_MSE_Vec, NUM_AVGS, lambda1, lambda2] = set_init_params();

    %% Iterate over all k values
    k_count = 1;
    for k = k_vals
        Empirical_MSE_Raw = zeros(NUM_AVGS, 1); 
        %% Generate data
        X0 = generate_data(n, k);
        for avg_idx = 1:NUM_AVGS 
            %% Creating noise matrix
            Z = randn(n, n); %noise matrix
            %% Create overall matrix
            Y = Gamma*X0 + Z; %measured values corrupt by noise
            %% Convex formulation for problem
            cvx_begin quiet
                variable X(n, n)
                minimize(0.5*square_pos(norm( Y - X , 'fro')) + lambda1*norm(X, 1) + lambda2*norm_nuc(X))
            cvx_end
            
            %% Empirical MSE Calculation
            Err = X - Gamma*X0; 
            Empirical_MSE_Raw = sum(Err(:).^2);
        end
        
        Empirical_MSE_Vec(k_count) = mean(Empirical_MSE_Raw);
        k_count = k_count + 1;
    end
end