function control_val = sir_controller(s, i, r, ...
    beta, gamma, alpha, lambda,...
    threshold, horizon)
    
    for control_val = 0 : 0.01 : 1
        [S, I, R, W] = model_simulate(s, i, r, beta, gamma, alpha, lambda, control_val, horizon);
        if (max(I) <= threshold)
            break;
        end
    end 
end