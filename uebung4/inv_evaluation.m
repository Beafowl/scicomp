function [] = inv_evaluation()

    % evaluate margin of error of the different calculations of the inverse

    x = 1:10000;
    y = zeros(1, 10000);

    for i = x

        A = rand(10,10);
      
        A_inv1 = myinv2(A);
        A_inv2 = inv(A);

        % calculate error

        B_1 = A*A_inv1-eye(10,10);
        B_2 = A*A_inv2-eye(10,10);

        err_1 = sum(abs(B_1));
        err_2 = sum(abs(B_2));

        q = err_2/err_1;

        y(1, i) = q;
    end

    plot(x,y);

    % gauss jordan gives very high margin of error, dont use it
    

    % cofactor vs inv from matlab: Margins do not fluctuate as strongly now
    % The error of the inv functions seems to be half of the error with the
    % cofactors

    % just like in exercise 2, the built in matlab functions are very well
    % optimized as expected

end

