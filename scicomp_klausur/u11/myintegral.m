function [y] = myintegral(a,b, type)

    % calculate integral

    f = @(x) x*exp(-x.^2);

    if type == "mittelpunkt"
        y = (b-a)*f((a+b)/2);
    elseif type == "trapez"

        y = ((b-a)/2) * (f(a) + f(b));

    elseif type == "simpson"

        y = ((b-a)/6)*(f(a) + 4*f((a+b)/2) + f(b));

    end
end

