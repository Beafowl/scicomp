function dx = ableiten(dateiname)

    table = csvread(dateiname);
    table = table.';

    dx = zeros(3, size(table,2));
    dx(1,:) = table(1,:);

    for j = 2:size(dx,2)-1

        % zentraler differenzenquotient
        dx(2,j) = (table(2, j+1) - table(2, j-1)) / 2;
    
        % zweite ableitung
        dx(3,j) = table(2,j+1) - 2*table(2,j) + table(2,j-1);
    end

    dx(:,1) = [];
    dx(:,end) = [];
end

