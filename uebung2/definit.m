function x = definit(A)

    % check form

    if size(A,1) ~= size(A,2)

        error("Matrix has to be square matrix");

    end

    % NxN matrix has N minors

    minors_A = zeros(1, size(A,1));
    minors_A_inv = zeros(1, size(A,1));

    % calculate minors

    A_inv = -A;

    for i = 1:size(A,1)

        minors_A(i) = det(A(1:i,1:i));
        minors_A_inv(i) = det(A_inv(1:i,1:i));
    end

    positive_definit = true;

    for i = minors_A

        if i <= 0

            positive_definit = false;

        end
    end

    % check if negative definit

    if ~positive_definit

        negative_definit = true;

        for i = minors_A_inv
            
            if i <= 0

                negative_definit = false;

            end
        end

        if negative_definit

            x = -1;

        else % neither postive or negative

            x = 0;

        end

    else 

        x = 1;

    end
end

