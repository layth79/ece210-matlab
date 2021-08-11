% Layth Yassin                  Hw#3                           ECE-210-B 
clc; clear;

%% 1.
clc; clear;
% part a
y = 1:256;
x = y.';
A_condition = sqrt(((x-128).^2)-((y-128).^2));
A = A_condition < 64;

% part b
B_condition = sqrt(((x-96).^2)-((y-96).^2));
B = B_condition < 64;

% part c 
% i. The figure produced by the code below represents a hyperbola, as
% defined in the question. It is the equivalent of rotating the xy-plot of
% the hyperbola by 90 degrees clockwise. It is also limited by the lines 
% x = 256 and y = 256 in the figure. The graph described in the previous 
% two sentences is shown in the figure and represented by the border of
% the black and white parts. The region covered by the inequality itself
% is represented by the white region in the figure. This description of
% the xy-plane corresponding to the figure is applicable to all parts in
% this question.

figure('Name','Logical Matrix: A');
imshow(A);

% ii. The hyperbola has now been shifted leftwards in the xy-plane 
% (upwards in the figure).

figure('Name','Logical Matrix: B');
imshow(B);

% iii. The figure shows the intersection between A and the complement of B.

C = A & ~B;
figure('Name','Logical Matrix: C');
imshow(C);

% iv. The figure shows the union between the complement of A and B.
D = ~A | B;
figure('Name','Logical Matrix: D');
imshow(D);

% part d
% The .* operator darkens the white areas of the images, but does not 
% affect the black areas. This is becuase logical 1 corresponds to white
% and logical 0 corresponds to black. When the matrices are multiplied
% elementwise, the 0's stay 0, and the 1's decrease when multiplied by
% values that are less than 1. Therefore, the black areas remain untouched,
% but the white areas become darker. 
% The + operator simply adds the elements of the matrices. Let X = E .* C 
% and Y = F .* D. The black areas in X take on the darkness of the
% corresponding area in Y and vice versa.
E = rand(256);
F = linspace(0, 0.25, 256) + linspace(0, 0.25, 256).';
G = E .* C + F .* D ;
figure('Name','Logical Matrix: E');
imshow(E);
figure('Name','Logical Matrix: F');
imshow(F);
figure('Name','Logical Matrix: G');
imshow(G);

%% 2.
clc; clear;
% part e
x = linspace(-2*pi, 2*pi, 1001);
y = sinc(x);
% i.
y_antideriv = antideriv(y, x);
% ii.
y_deriv = deriv(y, x);
% iii.
[y_extr, x_extr] = extrema(y, x);
% iv.
[y_infl, x_infl] = inflections(y, x);

plot (x ,y ,x , y_antideriv ,x, y_deriv , ...
x_extr , y_extr , 'r*' , x_infl , y_infl , 'bo');
title({'Plot of sinc(x) and its Antiderivative and Derivative with' 
'Critical Points'});
xlabel('x');
ylabel('y = sinc(x)');

% part a
function dydx = deriv(y, x)
    d = diff(y)./diff(x);
    dydx = [d, d(end)];
end

function i = antideriv(y, x)
    i = cumtrapz(y)*(x(end)/(numel(x)-1));
end

% part b
function v = switchsign(x)
    s = sign(x);
    d = diff(s);
    l = abs(d) > 1;
    v = [0 l(1:end)];
end

% part c
function [ex, xx] = extrema(y, x)
    dydx = deriv(y, x);
    s = find(switchsign(dydx));
    xx = x(s);
    ex = y(s);
end

% part d
function [inf, xx] = inflections(y, x)
    dydx = deriv(y, x);
    d2ydx2 = deriv(dydx, x);
    s = find(switchsign(d2ydx2));
    xx = x(s);
    inf = y(s);
end
