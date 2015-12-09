%December 5, 2015 
%Implementing a matrix completion algorithm for simultaneously structured
%matrices (https://faculty.washington.edu/mfazel/CDC2013_OJFH_final.pdf) 
Empirical_MSE_Vec_convex = noisy_est_sim_str_convex();
plot(Empirical_MSE_Vec_convex); 

Empirical_MSE_Vec_nonconvex = noisy_est_sim_str_nonconvex(); 
figure, plot(Empirical_MSE_Vec_nonconvex); 