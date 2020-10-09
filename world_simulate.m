function [S, I, R, U, W] = world_simulate(...
    s_0, i_0, r_0, ...
    beta, gamma, alpha, lambda, ...
    threshold, horizon, delay, num_steps)

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

control_queue = [0];
% Run simulation
for step = 2 : num_steps
    control_val = sir_controller(s, i, r, beta, gamma, alpha, lambda, threshold, horizon);
    % disp(control_val);
    control_queue = [control_queue, control_val];
    
    if(step - delay < 1 || step - delay > length(control_queue))
        current_control = control_queue(1);
    else
        current_control = control_queue(step - delay);
    end
    
    [s, i, r] = model_step(s, i, r, beta, gamma, alpha, lambda, current_control);
    S(step) = s;
    I(step) = i;
    R(step) = r;
end

U = control_queue;
end