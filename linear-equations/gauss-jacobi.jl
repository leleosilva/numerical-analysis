using LinearAlgebra

function gauss_jacobi(A::Array{<:Real}, b::Array{<:Real}, x::Array{<:Real},
    ε::Real=1e-5, max_iter::Integer=100)
    
    D = diag(A) # Getting main diagonal from A

    for iter in 1:max_iter

        previous_x = copy(x)

        # Using '.' (dot) to execute a vectorized division (broadcasting)
        deltax = (b - A*x) ./ D
        x = x + deltax

        #= Computing p-norm to verify the error using the function norm(A, p).
         = For p = Infinite, the function returns the largest value of |A| =#
        distance = norm(x - previous_x, Inf)
        error = distance / norm(x, Inf)

        if error <= ε # True if error <= ε
            return (x, iter, error, true)
        end
    end
    return (x, iter, error, false) # False if final error > ε