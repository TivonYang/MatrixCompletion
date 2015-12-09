
function Empirical_MSE_Vec = noisy_est_sim_str_nonconvex()
%% set initial parameters
    [n, k_vals, Gamma, Empirical_MSE_Vec, NUM_AVGS, ~, ~] = set_init_params();

    %% iterate over all k values
    k_count = 1;
    for k = k_vals
        %% generate data
        X0 = generate_data(n, k);
        %% Generate noise
        Z = randn(n, n); 
        %% calculate Empirical MSE several times and average the values
        Empirical_MSE_Raw = zeros(NUM_AVGS, 1); 
        for avg_idx = 1:NUM_AVGS 
            Y = Gamma*X0 + Z; %measured values corrupt by noise
            Empirical_MSE_Raw(avg_idx) = nonconvex_algorithm(Y, n, k, Gamma, X0);
        end
        
        Empirical_MSE_Vec(k_count) = mean(Empirical_MSE_Raw);
        k_count = k_count + 1;
    end
end