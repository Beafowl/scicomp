% Aufgabe 5 Fließkommazahlenformate

% Convert Bits into float

function [G] = float(bits)
    % Input variable bits is a char-array (string)

    % formula: G = (-1)^S * (1+F)*2^(E-B)

    S = str2double(bits(1));

    % check for single or double precision
    if strlength(bits) == 32
        E = bits(2:9);
        F = bits(10:32);
        B = 127;
    elseif strlength(bits) == 64
        E = bits(2:12);
        F = bits(13:64);
        B = 1023;
    else
        error("Length has to be either 32 or 64 bits");
    end

    % convert binary strings into actual integers

    F = bintodec_frac(F);
    E = bintodec_int(E);

    disp(F);
    disp(E);

    % implement formula

    G = (-1)^S * (1+F)*2^(E-B);
end

% For zero: 5.8775e-39
