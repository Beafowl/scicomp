function d = mydet(A)

    % matrix has to be square matrix
    
    if size(A,1) ~= size(A,2)
    
        error("Square matrix is needed");
    
    end

    % choose random column

    j = randperm(size(A, 1), 1);

    % j needs to be between 1 and size(A,1)

    if j < 1 && j > size(A,1)

        error("j is out of bounds");

    end

    % for matrix sizes up to 3, we do not need to use laplace
    % these are also the break conditions for the recursion
    % use sarrus

    if size(A,1) == 1 && size(A,2) == 1
    
        d = A(1,1);
        return;
    end
    
    if size(A,1) == 2
   
    
    d = A(1,1)*A(2,2)-A(1,2)*A(2,1);
        return
    end
    
    if size(A,1) == 3
    
        d = A(1,1)*A(2,2)*A(3,3)+A(1,2)*A(2,3)*A(3,1)+A(1,3)*A(2,1)*A(3,2)-A(1,3)*A(2,2)*A(3,1)-A(1,1)*A(2,3)*A(3,2)-A(1,2)*A(2,1)*A(3,3);
        return;
    end

    % use laplace expansion

    result = 0;

    for i = 1:size(A,2)

        % remove row and column from A
        % do not manipulate A

        A_copy = A;
        A_copy(i,:) = [];
        A_copy(:,j) = [];

        % calculate results recursively

        result = result + A(i,j)*(-1)^(i+j)*mydet(A_copy);

    end

    d = result;
end

