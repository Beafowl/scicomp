function G = giniIndex(S)

    % S: A set with attributes and an assigned class for each entry
    % An entry is in each row
    G = 1;
    num_entries = size(S,1);

    for c = 0:1

        num_class = 0;
        for s = S
    
            if s(size(s,2)) == c

                num_class = num_class + 1;
            end
        end

        G = G - (num_class/num_entries).^2;
    end
end

