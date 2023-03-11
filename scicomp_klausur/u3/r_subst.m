function x = r_subst(R, b)

    x = zeros(size(R,1),1);

    % rückwärtssubstitution
    for i = fliplr(1:size(R,1))

        if R(i,i) == 0
            error("Matrix R ist singulär");
        end

        for j = fliplr(i+1:size(R,1))

            b(i,1) = b(i,1) - x(j,1)*R(i,j);

        end

        x(i,1) = b(i,1) / R(i,i);

    end
end