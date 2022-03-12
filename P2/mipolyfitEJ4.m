function sol = mipolyfitEJ4(x, y, grado)
    A = zeros(height(x), grado*2+1);
    for i=1:grado*2
        A(:, i) = sin(i*x);
        i = i+1;
        A(:, i) = cos(i*x);

    end
    A(:,grado+1) = ones(size(x));
    coefs = pinv(A)*y;
    sol = A*coefs;
end