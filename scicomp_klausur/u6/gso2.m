function [Q, R] = gso2(A)
    
    Q = zeros(size(A));
    R = zeros(size(A));

    for k = 1:size(A,2)
        R(k,k) = norm(A(:,k));
        Q(:,k) = A(:,k)/R(k,k);
        for j = k+1:size(A,2)
            R(k,j) = Q(:,k).' * A(:,j);
            A(:,j) = A(:,j) - R(k,j) * Q(:,k);
        end
    end
end

