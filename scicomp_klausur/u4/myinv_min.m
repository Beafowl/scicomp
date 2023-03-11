function Ainv = myinv_min(A)

    % Kofaktormatrix berechnen

    K = zeros(size(A,1), size(A,2));

    for i = 1:size(A,1)
        for j = 1:size(A,2)

            D = A;
            D(i,:) = [];
            D(:,j) = [];
            K(i,j) = (-1).^(i+j)*det(D);

        end
    end

    % Determinante mithilfe des Entwicklungssatzes von Laplace berechnen
    % Es kann irgendeine Zeile oder Spalte aus K gewählt werden

    d = 0;
    j = 1;

    for i = 1:size(A,1)

        d = d + A(i,j)*K(i,j);

    end

    % Inverse mit der Formel berechnen

    Ainv = (1/d)*K.';

end

