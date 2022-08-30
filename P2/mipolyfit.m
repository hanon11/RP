function coefs = mipolyfit(x, y, grado)
    A = zeros(height(x), grado+1);
    for i=1:grado
        A(:, i) = (x).^i;
    end
    A(:,grado+1) = ones(size(x));
    coefs = pinv(A)*y;
end
