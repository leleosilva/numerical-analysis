# Function that calculates the composite Trapezoidal Rule
function trapezoidal(f::Function, a::Number, b::Number, intervals::Integer=10)
    
    # Initial check: whether interval is different from zero
    intervals != 0 || error("Division by 0")

    # Initial check: whether an interval is valid or not
    intervals > 0 && b > a || error("Invalid interval")
    
    n = intervals
    h = (b - a) / n

    integral = h * (f(a) + f(b)) / 2
    integral += h * sum([f(a + (h * subinterval)) for subinterval in range(1, n)])
    
    return integral
end