function x = quadrature(a,b)

    m = myintegral(a,b, "mittelpunkt");
    t = myintegral(a,b, "trapez");

    e = abs((t-m)/3);

    if e>power(10,-6)

        x = quadrature(a, (a+b)/2) + quadrature((a+b)/2, b);

    else
        
        disp(a + " - " + b);
        x = myintegral(a,b, "simpson");

    end
end

