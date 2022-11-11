function Ainv = myinv(A)

    % A needs to be a square matrix

    if size(A,1) ~= size(A,2)
        error("Matrix has to be square matrix");
    end

    % Solve linear equation for every column of the identity matrix
    % to get the inverse of A

%     I = eye(size(A,1), size(A,2));
% 
%     Ainv = zeros(size(A,1), size(A,2));
% 
%     for i = 1:size(A,2)
% 
%         Ainv(:,i) = mylinsolve(A,I(:,i));
% 
%     end

    % another method: Use elimination matrix on A to get diagonal matrix,
    % normalize diagonal matrix to identity matrix -> elimination matrix
    % will be the inverse of A
    % this is because A * A^-1 = I

    E = eye(size(A,1), size(A,2));

    for i = 1:size(A,1)
    
        % create elimination matrix for i-th column

        E_col = eye(size(A,1));
        
        for i2 = 1:size(A,1)
    
            
            if i == i2 % keep diagonal elements
                continue;
            end
            E_col(i2,i) = -A(i2,i)/A(i,i);
    
        end
    
        % apply elimination on A, add to elimination matrix
    
        A = E_col*A;
        E = E_col*E;

        % check for rows with only zeros, which means that the
        % matrix is not regular

        for i2 = 1:size(A,1)

            if isequal(A(i2,:),zeros(1,size(A,2)))

                error("Matrix is not regular");

            end
        end
    end

    % use diagonal values of A to create Ainv out of the elimination
    % matrix

    for i = 1:size(A,2)

        E(i,:) = E(i,:)/A(i,i);
    end

    Ainv = E;

end

