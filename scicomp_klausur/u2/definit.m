function x = definit(A)

    % check for square matrix

    if size(A,1) ~= size(A,2)
        error("Matrix needs to be a square matrix");
    end

    % check whether A is symmetric
    
    for x = 1:size(A,1)
        for y = 1:size(A,1)
            if A(x,y) ~= A(y,x)
                error("Matrix needs to be symmetric");
            end
        end
    end

    % positiv definit
    B = A;
    pd = true;

    while size(B,1) > 0

        hauptminor = mydet(B);
        if hauptminor < 0
            pd = false;
        end
        B(size(B,1),:) = [];
        B(:,size(B,2)) = [];
    end

    %{
    % negativ definit
    B = -A;
    nd = true;

    while size(B,1) > 0

        hauptminor = mydet(B);
        if hauptminor < 0
            nd = false;
        end
        B(size(B,1),:) = [];
        B(:,size(B,2)) = [];
    end
    %}

    % ein anderer weg für negativ definit
    % alle ungeraden führenden hauptminoren negativ,
    % alle geraden führenden hauptminoren positiv
    B = A;
    nd = true;

    while size(B,1) > 0
        hauptminor = mydet(B);
        if mod(size(B,1), 2) ~= 0

            if hauptminor > 0
                nd = false;
            end
        else
            if hauptminor < 0
                nd = false;
            end

        end
        B(size(B,1),:) = [];
        B(:,size(B,2)) = [];
    end

    % end result
    if pd
        x = 1;
    end
    if nd
        x = -1;
    end
    if ~nd && ~pd
        x = 0;
    end


end

