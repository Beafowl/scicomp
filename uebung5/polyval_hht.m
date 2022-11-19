function [] = polyval_hht()

    load('Messdaten.mat', 't', 'v');

    % use the hht function to create polynome
    % x is the coefficient vector. contains all coefficients of the
    % polynome we try to figure out
    % b ist the y vector (in this case v)
    % A consists of the exponents

    % width of A is 4 (cubic function)

    b = v;
    
    degree = 4;

    A = fliplr(0:degree);

    A = repmat(A,size(t,2),1);

    A = power(t',A);

    % after setting up A and b, calculate coefficients with hht

    p = hht(A,b');

    % plot the results

    y1 = mypolyval(p', t);
    y2 = polyval(p, t);

    % original curve
    plot(t,v);
    hold on;
    % approximated curve using mypolyval
    plot(t,y1);
    hold on;
    % approximated curve using polyval
    plot(t, y2);
    hold on;

    % now trying polyfit
    p = polyfit(t,v,degree);
    y3 = polyval(p, t);

    plot(t,y3);
    legend('Original', 'mypolyval', 'polyval', 'polyfit');

    % polyval, mypolyval and polyfit have very similar values, seeing them
    % in the plot is hard
    % the higher the degree, the more the curves will fit to the data
end