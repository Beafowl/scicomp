function [] = test_mydet()

    % define matrices for test

    A = [3 0; 1 5];
    B = [2 1; 7 3];
    C = [1 2 0; 3 5 5; 1 0 7];
    D = [1 2 3; 4 5 6; 7 8 9];

    matrices = {A, B, C, D};

    for testmatrix = 1:4

        results = zeros(1,1000);

        for i = 1:1000

            results(i) = mydet(matrices{testmatrix});

        end
        disp("Results for matrix " + testmatrix + " ---------------");

        disp("Mean = " + mean(results, "all"));
        disp("Std = " + std(results, 0, "all"));

    end


end

