function newton_raphson(f::Function, df::Function, x0::Number, ε::Real=1e-8, num_iter::Integer=100)

    x = x0
    # Runs the method for 'num_iter' iterations
    for _ in 1:num_iter
        x = x - f(x) / df(x)
        if abs(f(x)) < ε
            break
        end
    end
    return x
end