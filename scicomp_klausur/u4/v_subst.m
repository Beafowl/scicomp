function x = v_subst(L, b)

    x = zeros(size(L,1),1);

    % vorwärtssubstitution
    for i = 1:size(L,1)

        if L(i,i) == 0
            error("Matrix L ist singulär");
        end

        for j = 1:i-1

            b(i,1) = b(i,1) - x(j,1)*L(i,j);

        end

        x(i,1) = b(i,1) / L(i,i);

    end
end