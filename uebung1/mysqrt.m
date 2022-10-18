% Aufgabe 4 Hat jemand Wurzel gesagt?
% how should x0 be chosen?

function [x0] = mysqrt(x, eps)

    x0 = 1;

    x_plot = 0;
    y_plot = x0;
    counter = 1;
    MAX_ITERATIONS = 100;

    while(abs(x0^2 - x) > eps)
        
        if counter > MAX_ITERATIONS

            disp("100 Iterations exceeded, quitting loop");
            break;
        end

        x_plot = [x_plot, counter];

        x0 = 0.5 * (x0 + (x/x0));

        y_plot = [y_plot, x0];

        counter = counter + 1;
    end

    plot(x_plot, y_plot);
    title("Approximation of sqrt(x)");
    xlabel("Number of Iterations");
    ylabel("Value of the Iteration");
end

% Bei größer werdenden Zahlen wird die Anzahl der Iterationen minimal
% erhöht. Der Anstieg scheint logarithmisch zu sein

% Für sehr kleine Fehlertoleranzen scheint die Funktion nicht mehr
% ausführbar zu sein. Der Grund wird bei der Genauigkeit von
% Fließkommazahlen liegen, die bei so einer kleinen Zahl nicht mehr
% garantiert werden kann

% Man könnte eventuell nach zu vielen Iterationen die Schleife abbrechen,
% oder vorher überprüfen, ob die Toleranz zu klein gewählt wurde