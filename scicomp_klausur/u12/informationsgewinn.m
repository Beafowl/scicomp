function [L, R] = informationsgewinn(M,k)

    maxInform = 0;
    position = 1;

    for n = 0:size(M,2)

        L = M(:,1:n);
        R = M(:,n+1:size(M,2));
        
        % calculate gini index

        inform = ig(M, L, R);

        if inform > maxInform
            maxInform = inform;
            position = n;
        end
    end

    L = M(:,1:position);
    R = M(:,position+1:size(M,2));
end

