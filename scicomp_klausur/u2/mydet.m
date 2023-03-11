function d = mydet(A)

    % choose random value for j

    j = floor(rand() * size(A,1)) + 1;
        
    % A has to be a square matrix

    if size(A,1) ~= size(A,2)
        error("Matrix is not a square matrix");
    end

    % j has to be in range

    if j < 1 || j > size(A,1)
        error("j is not in range");
    end

    if size(A,1) == 1
        d = A(1,1);
    else
        d = 0;
    
        for i = 1:size(A,1)
    
            D = A;
            D(i,:) = [];
            D(:,j) = [];
    
            det_D = mydet(D);
    
            d = d + A(i,j)*(-1).^(i+j)*det_D;
    
        end
    end
end

