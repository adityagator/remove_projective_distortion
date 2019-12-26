function v = homography_solve(in, out)
x = out(1, :); y = out(2,:); X = in(1,:); Y = in(2,:);
rowsZero = zeros(3, 4);
rowsXY = -[X; Y; ones(1,4)];
mx = [rowsXY; rowsZero; x.*X; x.*Y; x];
my = [rowsZero; rowsXY; y.*X; y.*Y; y];
h = [mx my];
    [U, ~, ~] = svd(h);
v = (reshape(U(:,9), 3, 3)).';
end