function M = elim_matrix(A, j)
    
    if size(A,1) ~= size(A,2)
        error("Matrix needs to be a square matrix");
    end

    if j < 0 || j > size(A,2)
        error("j is out of range");
    end

    % j-te Spalte aus A eliminieren

    M = eye(size(A,1),size(A,2));

    for i = j+1:size(A,1)
    
        M(i,j) = -A(i,j)/A(j,j);
    
    end
end

