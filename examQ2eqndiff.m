function f = examQ2eqndiff(t, y)
f = zeros(size(y));
% On trouve f(1) et f(2) à la main d'abord
f(1) = y(2);
f(2) = 14.72.*cos(y(2))-1.84;
end
