function IG = ig(S, L, R)

    IG = giniIndex(S) - (size(L,1)/size(S,1)) * giniIndex(L) - (size(R,1)/size(S,1)) * giniIndex(R);
end

