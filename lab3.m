%%% Laboratoire 2 MTH1210 Philippe Lacasse-Labelle, Antoine Busque
clc;
close all;
%% Question 1
% a)
r = zeros(1, 10);
q = zeros(1, 10);

% On definit les termes de base
r(1) = 1;
q(1) = 1;
q(2) = 1/3;

% On genere le reste des termes des suites
for n=2:10
    r(n) = 1/3 * r(n - 1);
end

for n=3:10
    q(n) = 10/3 * q(n - 1) - q(n - 2);
end

fprintf('\t Voici les résultats des deux suites: \n')
fprintf('\t ____________________________________ \n')
fprintf('\t      n      r(n)         q(n)        \n')
for n=1:10
    fprintf('\t      %1d      %4.1e      %4.1e      \n', n-1, r(n), q(n))
end

% b) 
s = zeros(1,10);
for n=1:10
    s(n) = 1 / (3 ^ (n-1));
end

erreurQ = zeros(1,10);
erreurR = zeros(1,10);
for n=1:10
    erreurQ(n) = abs(s(n) - q(n));
    erreurR(n) = abs(s(n) - r(n));
end

% On constate que l'erreur entre Q et S ainsi que R et S est plus petite
% que la précision machine. On peut donc considérer que les valeurs sont
% équivalentes.

% c)
% On definit les termes de base
r(1) = 0.99996;
q(1) = 1;
q(2) = 0.33332;

% On genere le reste des termes des suites
for n=2:10
    r(n) = 1/3 * r(n - 1);
end

for n=3:10
    q(n) = 10/3 * q(n - 1) - q(n - 2);
end

fprintf('\t Voici les résultats des deux suites: \n')
fprintf('\t ____________________________________ \n')
fprintf('\t      n      r(n)         q(n)        \n')
for n=1:10
    fprintf('\t      %1d      %4.1e      %4.1e      \n', n-1, r(n), q(n))
end

deltaQ = zeros(1, 10);
deltaR = zeros(1, 10);

for n=1:10
    deltaQ(n) = abs(s(n) - q(n));
    deltaR(n) = abs(s(n) - r(n));
end

fprintf('\t Voici les erreurs des deux suites: \n')
fprintf('\t ____________________________________ \n')
fprintf('\t      n      delta r(n)   delta q(n)        \n')
for n=1:10
    fprintf('\t      %1d      %4.1e      %4.1e      \n', n-1, deltaR(n), deltaQ(n))
end

x = 1:1:10;

figure;
semilogy(x, deltaR, '-o', x, deltaQ, '-x');
title('Erreur entre S(n) et ses approximations')
xlabel('L''axe des n');
ylabel('L''erreur absolue');
legend('S(n) - R(n)', 'S(n) - Q(n)');

% d)
% deltaR(n) ~= 1/3 * deltaR(n-1) est décroissant car on multiplie le terme
% précédent par 1/3 qui est inférieur à 1, ce qui donne une erreur de plus
% en plus petite. 
% deltaQ(n) ~= 10/3 * deltaQ(n-1) + deltaQ(n-2) est quant à lui croissant
% car on multiplie le terme précédent par 10/3 qui est supérieur à 1, puis
% on lui additionne un autre terme d'erreur lui aussi positif, ainsi
% l'erreur absolue croit avec n.

