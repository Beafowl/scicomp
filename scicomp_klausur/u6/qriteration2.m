function [E] = qriteration2(A)

    %threshold = 10.^-6;
    threshold = power(10, -6);
    num_iterations = 0;

    while true

        % Before applying the QR decomposition, shift diagonal
        % elements of A

        % the shifting parameter sigma should me close to an
        % eigenvalue, so try to approximate it

        % one solution: Take a 2x2 submatrix which is the submatrix
        % of A in the lower right corner and calculate the 
        % eigenvalue of it
        % Just choose the first eigenvalue

        %sigma = 1000;
        %disp(sigma);
        sigma = eig(A(size(A,1)-1:size(A,1), size(A,2)-1:size(A,2)));
        sigma = sigma(1,1);

        [Q, R] = gso2(A - sigma * eye(size(A)));

        A = (R * Q) + sigma * eye(size(A));

        disp(A);
        num_iterations = num_iterations + 1;

        % Eigenvalues are in the diagonal elements of A

        E = zeros(size(A,1),1);
    
        for k = 1:size(A,2)
    
            E(k,1) = A(k,k);
            if abs(sigma-A(k,k)) < threshold
                disp("Number of iterations: " + num_iterations);
                return
            end
        end
    end
end

% The closer sigma is to an eigenvalue, the lesser time the 
% algorithm needs
% But if sigma is an actual eigenvalue, the algorithm bricks 
% it gets stuck in the while loop