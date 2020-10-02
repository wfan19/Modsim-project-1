function control_val = sir_controller(s, i, r, ...
    beta, gamma, alpha, lambda,...
    threshold, horizon)

    control_val = 0;
    
    for control_val = 100 : -1: 1
        [S, I, R, W] = model_simulate(s, i, r, beta, gamma, alpha, lambda, control_val, horizon);
        if (max(I) >= threshold)
            break;
        end
    end
    
    control_val = control_val - 1; 
end