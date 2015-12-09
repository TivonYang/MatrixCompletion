function [n, k_vals, Gamma, Empirical_MSE_Vec, NUM_AVGS, lambda1, lambda2] = set_init_params()
n = 30;
k_vals = 3:13; 
Gamma = 10^2.5; % [10^0 10^0.5 10^1 10^1.5 10^2]; %Signal to Noise Ratio
Empirical_MSE_Vec = zeros(numel(k_vals), 1); %MSE for each value of k
NUM_AVGS = 200; %number of MSE values to be averaged 
lambda1 = 0.8;
lambda2 = 5; 
end