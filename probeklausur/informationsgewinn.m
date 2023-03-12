function [L, R] = informationsgewinn(M, k)

    % Check if M only has k classes

    for i = M(2,:)

        if ~(i >= 1 && i <= k)
            error("Klassen sind nicht gültig");
        end
    end

    % sort M

    %M = sort(M);

    % split everywhere, calculate giniindex

    maximum_ig = 0;
    position = 0;

    for i = 0:length(M)

        L = M(:,1:i);
        R = M(:,i+1:length(M));

        %entropy_R = 0;
        %entropy_L = 0;

        entropy_R = 1;
        entropy_L = 1;
        entropy_M = 1;

        for k_ = 1:k

            occurence_k = 0;

            for vec = R

                if vec(2) == k_
                    occurence_k = occurence_k + 1;
                end
            end

            p_R = occurence_k/size(R,2);
            occurence_k = 0;

            for vec = L

                if vec(2) == k_
                    occurence_k = occurence_k + 1;
                end
            end

            p_L = occurence_k/size(L,2);

            occurence_k = 0;

            for vec = M

                if vec(2) == k_
                    occurence_k = occurence_k + 1;
                end
            end

            p_M = occurence_k/size(M,2);

            % actual entropy
            %entropy_R = entropy_R - (p_R*log2(p_R));
            %entropy_L = entropy_L - (p_L*log2(p_L));

            % gini index
            entropy_R = entropy_R - p_R^2;
            entropy_L = entropy_L - p_L^2;
            entropy_M = entropy_M - p_M^2;
        end

        % calculate ig
        
        ig = entropy_M - size(L,2)/size(M,2)*entropy_L - size(R,2)/size(M,2)*entropy_R;

        if ig > maximum_ig
            maximum_ig = ig;
            position = i;
        end
    end

    L = M(:,1:position);
    R = M(:,position+1:length(M));

end

