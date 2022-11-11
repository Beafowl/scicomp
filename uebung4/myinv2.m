function Ainv = myinv2(A)

    if size(A,1) ~= size(A,2)
        error("Matrix muss quadratisch sein");
    end

    % calculate matrix of cofactors

    K = zeros(size(A,1), size(A,2));

    for i = 1:size(A,1)
        for j = 1:size(A,2)
            D = A;
            D(i,:) = [];
            D(:,j) = [];
            D = det(D) * (-1)^(i+j);
            K(i, j) = D;
        end
    end

    % calculate the determinant of A, which can be simply done with the
    % cofactor matrix
    % simply sum row or column of the row or colwise multiplication of
    % A and K (laplace expansion)

    d = sum(K(1,:).*A(1,:));

    Ainv = (1/d)*K';

end

