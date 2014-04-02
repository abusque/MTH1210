%%% Devoir MTH1210 Antoine Busque
%% Question 2
% a) voir feuille
% b)
t0 = 0;
y0 = [0 12.88];
h = 1/10;
nbPas = (3 - 0) / h;
t = 0:h:3;

% solution numerique par runge-kutta
[t, y1] = rk4('examQ2eqndiff', t0, y0, h, nbPas);

% L'angle est dans la premiere colonne de y1, la vitesse dans la seconde
angle = y1(:,1);
vitesse = y1(:,2);

accel = 0;

for i=1:nbPas+1
    f = examQ2eqndiff(h * i, [angle(i) vitesse(i)]);
    accel(i) = f(2);
end

% Graphique de l'angle, vitesse et accel
figure;
plot(t, angle, 'r x', t, vitesse, 'b +', t, accel, 'g o');
title('Mouvement d''un objet en rotation autour d''un axe');
xlabel('Temps en secondes');
ylabel('Unites (rad, rad/s ou rad/s^2)');
legend('Angle en radians', 'Vitesse en rad/s', 'Accel en rad/s^2');

% c)
[maxAngle index] = max(angle);
tempsMaxAngle = h * index;
vitesseMaxAngle = vitesse(index);
f = examQ2eqndiff(tempsMaxAngle, [maxAngle vitesseMaxAngle]);
accelMaxAngle = f(2);
