function [t,y] = euler(f,t0,y0,h,nbpas)
%
%  M�thode d'Euler pour les syst�mes d'�quations diff�rentielles
%    de la forme y'(t) = f(t,y(t)) {SD}
%
%  Pr�alable:
%  Vous devez creer un fichier .m contenant la fonction f(t,y).
%  Voir par exemple le fichier eqndiff.m
%
%  Exemples d'appel:
%  [t,y] = euler('eqndiff',0.0,[1 1],1.0e-1,10)
%
%  Arguments en entr�e:
%  1) f: Le nom entre apostrophes (' ') du fichier .m contenant la fonction
%     f(t,y).
%  2) t0: le temps initial
%  3) y0: la(les) condition(s) initiale(s), sous la forme d'un vecteur ligne:
%         par exemple, [1 2]. La dimension de y0 donne la dimension du syst�me
%  4) h: le pas de temps
%  5) nbpas: le nombre maximal de pas de temps
%
%  Arguments en sortie:
%  1) t est un vecteur contenant les temps, ti
%  2) y est une matrice contenant la solution obtenue:
%     la colonne i de y correspond a la solution de l'�quation i

% on fait quelques calculs pr�liminaires

nbeq = size(y0,2);
y0 = y0';
k1 = zeros(nbeq,1);
y = zeros(1,nbeq);
n = 1;
t(1) = t0;
y(1,:) = y0';
warning off

% la boucle transitoire

while(n <= nbpas),

  % on fait quelques v�rifications de base

  k1 = feval(f,t(n),y0);
  if (any(~isfinite(k1))),
    disp('la fonction n''est pas definie en certains points');
    return;
  end

  % la m�thode d'Euler est ici!

  y0 = y0 + h * k1;
  y(n+1,:) = y0';
  t(n+1) = t(n) + h;
  n = n+1;
  
end
