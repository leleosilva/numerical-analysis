function bisection(f::Function, a::Number, b::Number, ε::Real=1e-4, num_iter::Integer=100)
    
    # Initial check: whether a root exists in [a, b]
    f(a)f(b) <= 0 || error("No real root in [a, b]")
    
    # Runs the method for 'num_iter' iterations 
    for _ in 1:num_iter

        x = (a + b) / 2

        if f(x) == 0 || abs(b - a) < ε
            return x;
        end

        if f(a)f(x) > 0 # Root exists in the first half of [a, b]
            a = x
        else # Root exists in the second half of [a, b]
            b = x
        end
    end
    return Nothing # Real root not found in [a, b]
end