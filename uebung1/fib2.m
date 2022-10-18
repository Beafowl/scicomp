% Aufgabe 2 Fibonacci

% Linear complexity should be fine
function[output] = fib2(n)
    
    if n <= 2
        output = 1;
        return
    end

    first = 1;
    second = 1;
    next = 0;

    for i = 1:n-2
        next = first + second;
        first = second;
        second = next;
    end

    output = next;
end

% very bad complexity dont use this
% n^2
function [output] = fib(n)

if n <= 0 || ~(floor(n) == n)
    error("Zahl ungültig");
end

if n == 1 || n == 2
    output = 1;
else
    output = fib(n-1) + fib(n-2);
end
end

% n = 10: 55, n = 50: 1.2586e+10, n = 100: 3.5422e+20, n = 10000: Inf
% Inf probably only means overflow