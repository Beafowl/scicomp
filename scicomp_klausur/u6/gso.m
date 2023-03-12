function [Q, R] = gso(A)

    % Gram-Schmidt-Orthogonalisierungsverfahren
    % Wird instabil für sehr kleine Werte
    % Orthogonalität geht verloren

    Q = zeros(size(A));
    R = zeros(size(A));

    for k = 1:size(A,2)
        Q(:,k) = A(:,k);

        for j = 1:k-1

            R(j,k) = Q(:,j).' * A(:,k);
            Q(:,k) = Q(:,k) - R(j,k) * Q(:,j);
        end

        R(k,k) = norm(Q(:,k));
        Q(:,k) = Q(:,k) / R(k,k);
    end
end

