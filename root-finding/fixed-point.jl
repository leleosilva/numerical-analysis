function fixed_point(φ::Function, x0::Number, ε::Real=1e-5, num_iter::Integer=100)
    
    # Runs the method for 'num_iter' iterations
    for _ in 1:num_iter
        x1 = φ(x0)

        if abs(x1 - x0) < ε
            return x1
        end

        x0 = x1
    end
    return Nothing # Method didn't converge, return 'Nothing'
end