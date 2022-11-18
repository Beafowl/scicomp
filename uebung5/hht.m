function [x] = hht(A,b)
   
%     a = [2 1 2]';
% 
%     v = a + sign(a(1,1)) * norm(a)*[1 0 0]';
% 
%     H = eye(size(v,1)) - 2*((v*v')/(v'*v));
% 
%     new = a - 2*((v'*a)/(v'*v))*v;
% 
%     disp(new);

    % use householder transformation on NxM matrix
   
    iteration_matrix = A;
    iteration_result = b;

    I = eye(size(A,1));

    for i = 1:size(A,2)

        a = iteration_matrix(:,i);

        a(1:i-1,1) = 0;

        if i == 1

            aen = sign(a(1,1)) * norm(a)*I(:,i);

        else

            aen = -norm(a)*I(:,i);

        end
        v = a + aen;

        % create householder matrix
        H = eye(size(v,1)) - 2*((v*v')/(v'*v));

        iteration_matrix = H*iteration_matrix;
        iteration_result = H*iteration_result;
    end

    % cut the matrix and vector to the right form

    iteration_matrix = iteration_matrix(1:size(iteration_matrix,2),:);
    iteration_result = iteration_result(1:size(iteration_matrix,2),1);

    % use backwards substitution for results (from exercise 3)

    % Rückwärtssubstitution
    % U*x = y

    x = zeros(size(iteration_matrix,2), 1);

    for i = fliplr(1:size(iteration_result,1))

        currentResult = iteration_result(i);

        for i2 = fliplr(i+1:size(iteration_matrix,2))

            currentResult = currentResult - x(i2)*iteration_matrix(i,i2);

        end

        currentResult = currentResult / iteration_matrix(i,i);

        x(i) = currentResult;
    end
end

