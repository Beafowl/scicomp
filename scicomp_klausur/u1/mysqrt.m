function [] = mysqrt(x, eps)

    x_hat = 1;

    y = [];

    while abs(x_hat^2 - x) > eps

        y(end + 1) = x_hat;
        x_hat = 0.5 * (x_hat + (x/x_hat));
        

    end

    plot(y);

    xlabel("Iterationsschritte in n");
    ylabel("Iterationswert");
    title("Approximation der Wurzel");
end

