function Ainv = myinv(A)

    % Die Determinante darf nicht 0 sein

    if det(A) == 0
        error("Matrix ist nicht invertierbar");
    end

    Ainv = zeros(size(A,1), size(A,2));

    E = eye(size(A,1));

    for j = 1:size(A,2)

        b = E(:,j);
        
        x = mylinsolve(A,b);

        Ainv(:,j) = x;
    end
end

