function [S, I, R, W] = model_simulate(s_0, i_0, r_0, beta, gamma, alpha, num_steps)

% Setup
S = zeros(1, num_steps);
I = zeros(1, num_steps);
R = zeros(1, num_steps);
W = 1 : num_steps;

s = s_0;
i = i_0;
r = r_0;

% Store initial values
S(1) = s;
I(1) = i;
R(1) = r;

% Run simulation
for step = 2 : num_steps
    [s, i, r] = model_step(s, i, r, beta, gamma, alpha);
    S(step) = s;
    I(step) = i;
    R(step) = r;
end

end