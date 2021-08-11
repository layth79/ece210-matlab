% Layth Yassin                      Hw#4                        ECE-210-B
clc; clear; close all;

%% 1.
clc; clear; close all;

% part d
% testing for more elements in each vector than number of vectors
r_mat1 = rand(5, 4) + 1i * rand(5, 4);
r_col1 = rand(5, 1) + 1i * rand(5, 1);
gs1 = gram_schmidt(r_mat1);
r_mat_check1 = is_orthonormal(r_mat1);
gs_check1 = is_orthonormal(gs1);
proj1 = ortho_proj(r_col1, gs1);

% testing for equal amount of vectors and elements
r_mat2 = rand(5, 5) + 1i * rand(5, 5);
r_col2 = rand(5, 1) + 1i * rand(5, 1);
gs2 = gram_schmidt(r_mat2);
r_mat_check2 = is_orthonormal(r_mat2);
gs_check2 = is_orthonormal(gs2);
proj2 = ortho_proj(r_col1, gs2); % using the same random column vector as 
% the other case

% computing the error
error = norm(proj1 - proj2);

% part e
x = linspace(0,2*pi, 1000);
y = sin(x);

[u] = ndgrid(0:pi/2:2*pi);
sig = 1;

gaussian = (1/sqrt(2*pi*(sig)^2)) * exp((-(x-u).^2)/sig^2);

plot(x, y, x, gaussian);
title('Plot of sin(x) and 5 Gaussians');
xlabel('x');
ylabel('y');
legend('sin(x)', '\mu = 0', '\mu = pi/2', '\mu = pi', ...
    '\mu = 3pi/2', '\mu = 2pi');

gaussian = transpose(gaussian);
y = transpose(y); 

gs_gaus = gram_schmidt(gaussian);
proj_gaus = ortho_proj(y, gs_gaus); 

figure();
tiledlayout(2, 1);

nexttile();
plot(x, y, x, proj_gaus);
title('Plot of sin(x) and estimate of sin(x)');
xlabel('x');
ylabel('sin(x) and estimate');
legend('sin(x)','estimate of sin(x)');

nexttile();
plot(x, gs_gaus);
title('Plot of Orthonormal Basis Functions vs x');
xlabel('x'); 
ylabel('Value of Basis Functions'); 
legend('Function 1', 'Function 2', 'Function 3', 'Function 4', ...
    'Function 5');

%% functions
% part a
function Gs = gram_schmidt(M)
    [m, n] = size(M);
    Gs = zeros(m, n);
    Gs(1:m, 1) = M(1:m, 1)/norm(M(1:m, 1));
    for k = 2:n
        w = M(1:m, k);
        v = zeros(m, 1);
        for j = 1:(k-1)
            v = v + (dot(w, conj(Gs(1:m, j)))/ ...
                (norm(Gs(1:m, j))^2)) * Gs(1:m, j);
        end
        v = w - v;
        phi = v/norm(v);
        Gs(1:m, k) = phi;
    end
end

% part b
function boolean = is_orthonormal(M)
    [m, n] = size(M);
    % test for normality
    for i = 1:n
        v1 = M(1:m, i);
        if norm(v1) - 1 <= 10 * eps
            boolean = 1;
        else
            boolean = 0;
            return
        end
    end
    % test for orthogonality
    for i = 1:round(n/2)
        v2 = M(1:m, i);
        for j = (i + 1):n
            w = M(1:m, j);
            d = dot(v2, conj(w));
            if d <= 10 * eps
                boolean = 1;
            else
                boolean = 0;
                return
            end
        end
    end
end

% part c
function v = ortho_proj(col, M)
    [m, n] = size(M);
    v = 0;
    for i = 1:n
        v = v + dot(col, conj(M(1:m, i)))*M(1:m, i);
    end
end
