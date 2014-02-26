function f = eqndiffY2(t, y)
k = 0.83e-6;
m = 0.001781163;
g =  32.17;
f = zeros(size(y));
% On trouve f(1) et f(2) à la main d'abord
f(1) = y(2);
f(2) = -(k./m.*abs(y(2)).*y(2)) - g;
end
