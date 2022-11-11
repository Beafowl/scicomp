function x = mylinsolve(A,b)

    % use gauss jordan algorithm to solve linear equation

    if size(A,1) ~= size(A,2)
        error("Matrix has to be square matrix");
    end

    for i = 1:size(A,1)
    
        % create elimination matrix for i-th column

        E = eye(size(A,1));
        
        for i2 = 1:size(A,1)
    
            
            if i == i2 % keep diagonal elements
                continue;
            end
            E(i2,i) = -A(i2,i)/A(i,i);
    
        end
    
        % apply elimination on A and b
    
        A = E*A;
        b = E*b;

        % check for rows with only zeros, which means that the
        % matrix is not regular

        for i2 = 1:size(A,1)

            if isequal(A(i2,:),zeros(1,size(A,2)))

                error("Matrix is not regular");

            end
        end
    end

    % use diagonal values of A to get x

    x = zeros(size(A,2), 1);

    for i = 1:size(A,2)

        x(i,1) = b(i,1)/A(i,i);

    end
end

