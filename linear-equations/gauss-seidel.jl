using LinearAlgebra

function gauss_seidel(A::Array{<:Real}, b::Array{<:Real}, x::Array{<:Real},
    ε::Real=1e-5, max_iter::Integer=100)
    
    n_rows, n_cols = size(A)
    
    deltax = zeros((n_rows, 1)) # Initializing deltax to avoid undefined behavior
    
    # Converting x from Real to Float64 to avoid cases where Real=Int64
    x = convert(Array{Float64}, x)

    final_iter = 0
    for iter in 1:max_iter

        previous_x = copy(x)

        for i=1:n_rows
            deltax[i] = b[i]

            for j=1:n_cols
                deltax[i] = (deltax[i] - A[i, j] * x[j])
            end

            deltax[i] = deltax[i] / A[i,i] # Dividing value by the diagonal of A
            x[i] = x[i] + deltax[i]
        end

        #= Computing p-norm to verify the error using the function norm(A, p).
         = For p = Infinite, the function returns the largest value of |A| =#
        distance = norm(x - previous_x, Inf)
        error = distance / norm(x, Inf)

        if error <= ε # True if error <= ε
            return (x, iter, error, true)
        end
        final_iter = iter
    end
    return (x, final_iter, error, false) # False if final error > ε
end