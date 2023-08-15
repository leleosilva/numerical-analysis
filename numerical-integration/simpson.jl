# Function that calculates the Simpson's 1/3 Rule
function simpson(f::Function, a::Number, b::Number, intervals::Integer=10)
    
    # Initial check: whether interval is different from zero
    intervals != 0 || error("Division by 0")

    # Initial check: whether an interval is valid or not
    intervals > 0 && b > a || error("Invalid interval")
    
    m = intervals
    h = (b - a) / m

    integral = (h / 3) * (f(a) + f(b))

    # Odd intervals
    integral += 4 * (h / 3) * sum([f(a + (h * subinterval)) for subinterval in range(1, m, step=2)])
    
    # Even intervals
    integral += 2 * (h / 3) * sum([f(a + (h * subinterval)) for subinterval in range(2, m - 1, step=2)])
    
    return integral
end