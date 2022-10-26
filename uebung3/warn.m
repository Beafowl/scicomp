function [] = warn()

    quotients = zeros(1, 10000);
    x_x = 1:10000;

    for i = 1:10000

        % correct variables
    
        A = rand(10, 10);
        x = rand(10, 1);
        b = A*x;
    
        % trying to solve it
    
        x_inv = inv(A)*b;
        x_backslash = A\b;
    
        % calculate error
        
        err_inv = norm(x - x_inv);
        err_backslash = norm(x - x_backslash);
    
        quotients(i) = err_inv / err_backslash;

    end
    plot(x_x, quotients);

    % plot looks like noise
    % sometimes the value can go up as high as 80, meaning the error
    % with the inverse is 80 times higher than the error with the 
    % backslash operator

end

