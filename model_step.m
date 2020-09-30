function [s_n, i_n, r_n] = model_step(s, i, r, beta, gamma, alpha)

susceptible = alpha * r;
infected = beta * i * s;
recovered = gamma * i;
    
% Update state
s_n = s - infected + susceptible;
i_n = i + infected - recovered;
r_n = r + recovered - susceptible;

% Enforce invariants; necessary since we're doing a discrete approx.
s_n = max(s_n, 0);
i_n = max(i_n, 0);
r_n = max(r_n, 0);
    
end