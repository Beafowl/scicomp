function x = bisektion(func, a, b, tol)
  
    if ~(a < b)
        error("a muss kleiner als b sein");
    end
    
    x = zeros(1, length(tol));
    iterations = zeros(1, length(tol));

    old_a = a;
    old_b = b;

    for t = 1:length(tol)

        num_iterations = 0;
        a = old_a;
        b = old_b;

        while (b-a) > tol(t)
    
            m = a + (b-a)/2;
            % m = (a+b)/2
    
            if sign(func(a)) == sign(func(m))
    
                a = m;
    
            else
    
                b = m;
            end
            num_iterations = num_iterations + 1;
        end
        x(t) = a;
        iterations(t) = num_iterations;
    end

    x_ = 1:length(tol);
    plot(x_,iterations, "msquare");

end

