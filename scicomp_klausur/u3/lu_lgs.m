function x = lu_lgs(A,b)

    % Lösen des LGS mittels LU-Zerlegung

    L = eye(size(A,1));

    for j = 1:size(A,1)-1

        M_x = elim_matrix(A,j);

        A = M_x*A;
        L = L*M_x;

    end

    % vorwärts und rückwärtssubstitution

    y = v_subst(L, b);
    x = r_subst(A, y);

end

