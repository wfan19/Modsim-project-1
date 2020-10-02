function [S, I, R, W] = world_simulate(...
    s_0, i_0, r_0, ...
    beta, gamma, alpha, lambda, ...
    delay, num_steps)

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
    
    control = 0;
    % control = controller(s, i, r, beta, gamma, alpha, lambda, threshold)
    control_queue = [control_queue, control];
    
    current_control = 0;
    if(step - delay > 1)
        current_control = control_queue(current_control);
    end
    
    [s, i, r] = model_step(s, i, r, beta, gamma, alpha, lambda, current_control);
    S(step) = s;
    I(step) = i;
    R(step) = r;
end

end