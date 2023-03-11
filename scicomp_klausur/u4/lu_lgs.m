function x = lu_lgs(A,b)

    % ist die Matrix symmetrisch positiv definit?
    % dann kann die Cholesky-Zerlegung verwendet werden

    symmetric = true;

    if size(A,1) == size(A,2)

        for i = size(A,1)
            for j = size(A,2)

                if A(i,j) ~= A(j,i)

                    symmetric = false;

                end
            end
        end
    end

    % positiv definit: alle führenden hauptminoren positiv

    pd = true;

    B = A;

    for n = fliplr(1:size(A,1))

        if det(B) < 0

            pd = false;
            break;
        end

        B(:,n) = [];
        B(n,:) = [];

    end

    if pd && symmetric
        disp("Using Cholesky");
    else
        disp("Using LU");
    end


    % Lösen des LGS mittels LU-Zerlegung

    L = eye(size(A,1));

    for j = 1:size(A,1)-1

        M_x = elim_matrix(A,j);

        if ~(pd && symmetric) % falls keine cholesky zerlegung möglich
            A = M_x*A;
        end
        L = L*M_x;

    end

    if pd && symmetric

        A = L.';

    end

    % Eliminationsmatrix und L-Matrix sind nicht exakt gleich
    % Einträge ausserhalb der Diagonalen müssen negiert werden

    for i = 1:size(A,1)
        for j = 1:i-1
            L(i,j) = (-1)*L(i,j);
        end
    end

    % vorwärts und rückwärtssubstitution

    y = v_subst(L, b);
    x = r_subst(A, y);

end

