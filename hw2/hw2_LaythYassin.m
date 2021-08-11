% Layth Yassin                  Hw#2                           ECE-210-B                               
clc; clear;

%% 1.
clc; clear;
% part a
t1 = linspace(0,2*pi,100);
g1 = (1 + t1).^(-1);

t2 = linspace(0,2*pi,1000);
g2 = (1 + t2).^(-1);

% part b
g1_diff = diff(g1)./diff(t1);
g2_diff = diff(g2)./diff(t2);

% part c
g1_hand = -(1 + t1).^(-2);
g1_prime = g1_hand(1:99);
g2_hand = -(1 + t2).^(-2);
g2_prime = g2_hand(1:999);

% part d
error99 = (1/99) * sum((g1_prime - g1_diff).^2);
error999 = (1/999) * sum((g2_prime - g2_diff).^2);
% the error for the 99 element vector is smaller

% part e
% approximating integrals with cumsum and cumtrapz
g1_cumsum = cumsum(g1)*((2*pi)/(100)); % should divide by 99, 999
g1_cumtrapz = cumtrapz(g1)*((2*pi)/(100));
g2_cumsum = cumsum(g2)*((2*pi)/(1000));
g2_cumtrapz = cumtrapz(g2)*((2*pi)/(1000)); % best estimate for integral 
% using antiderivative to evaluate t1 and t2
g1_anti = log(1 + t1);
g2_anti = log(1 + t2);
% calculations for errors
error_cumsum99 = (1/99) * sum((g1_anti - g1_cumsum).^2);
error_cumtrapz99 = (1/99) * sum((g1_anti - g1_cumtrapz).^2);
error_cumsum999 = (1/999) * sum((g2_anti - g2_cumsum).^2);
error_cumtrapz999 = (1/999) * sum((g2_anti - g2_cumtrapz).^2);

% part f
plot(t2, g2_cumtrapz)
title('Best Estimate for Integral')
xlabel('t')
ylabel('g(t)')
grid on

%% 2.
clc; clear;
% part a
y = logspace(0,49);
A = transpose(reshape(y,[5,10]));
C = A; % A copied to another var to operate on

% part b
C(3,:) = fliplr(A(3,:)); % C now represents A with a flipped third row

% part c
col_vect = nthroot(prod(A,2),5);

% part d
B = A(6:8,2:4);

% part e
D = A;
D(5:10,:) = []; % D is A with rows 5-10 deleted

%% 3.
clc; clear;
% part a
tic
for i = 1:1000
    for j = 1:1000
        C1(i,j) = (2*(i)^(4))/(3*j+2);
    end
end
toc
% The time for part a makes sense since it is the greatest. There is no 
% pre-allocation, which means MATLAB has to continuously change the matrix 
% size, which can be relatively expensive.

% part b
tic
C2 = zeros(1000);
for i = 1:1000
    for j = 1:1000
        C2(i,j) = (2*(i)^(4))/(3*j+2);
    end
end
toc
% The time for part b makes sense since it is much faster than both part a
% and c. This is because there is pre-allocation, which means MATLAB sets 
% aside a block of memory for the matrix created beforehand. This means 
% that all that has to be done is to populate the matrix, which is much
% less expensive than looking for memory and populating.

% part c
tic
i = 1:1000;
j = 1:1000;
[J,I] = meshgrid(j,i);
C3 = (2.*(I).^(4))./(3.*J+2);
toc
% The time for part c makes sense since it is much faster than part a, but
% slower than part b and d. This method is slower than part b and d because
% of the extra cost of allocating the 2 arrays in memory.

% part d
tic
j1 = linspace(1,1000,1000);
i1 = j1';
C4 = (2.*(i1).^(4))./(3.*j1+2);
toc
% The time for part d makes sense because it is significantly faster than
% all the other parts. This is because there is no runtime memory
% allocation. This method only consists of matrix operations which are not
% expensive relative to the other parts in this question. It also does not
% consist of a for loop.