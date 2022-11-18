function [] = mypolyval()

    % load function
    % optionally we can use p and x as arguments of the function
    load('Messdaten.mat', 't', 'v');

    plot(t,v);

    % implement polyval(p,x)

    % cubic function
    p = [8,10,1,-20];

    % calculate x^3 + x^2 ... for every value of t
    pows = t.^([3 2 1 0]');

    % vector multiplication to get the y values
    y_val = p * pows;

    plot(t,y_val);
    hold on
    plot(t,v);
    hold off
end