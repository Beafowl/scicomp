function [E] = qriteration(A)

    %threshold = 10.^-6;
    threshold = power(10, -6);
    num_iterations = 0;

    while true

        [Q, R] = gso2(A);

        A = R * Q;

        % To test for convergence, we can use the gerschgorin circle
        % sum of absolute elements of the matrix excluding the
        % diagonal elements
    
        g = 0;

        for i = 1:size(A,1)
            for j = 1:size(A,2)

                if i ~= j
                    g = g + abs(A(i,j));
                end
            end
        end

        if g < threshold
            break
        end
        num_iterations = num_iterations + 1;
    end

    % Eigenvalues are in the diagonal elements of A

    E = zeros(size(A,1),1);

    for k = 1:size(A,2)

        E(k,1) = A(k,k);
    end
    disp("Number of iterations: " + num_iterations);
end