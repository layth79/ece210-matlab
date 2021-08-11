% Layth Yassin                  HW#1                        ECE-210-B 

%% 1. 

% created variables with appropriate values
a = abs(4+5j);
b = j^j;
c = (2*exp(1)+4j)^(1/2);
d = asec(5-2j);

A = [a, b, c, d]; % row vector with variables above as entries


%% 2. 

% computed real and imaginary parts, norm, and phase of complex vars in #1
real_c = real(c);
imag_c = imag(c);
norm_c = abs(c);
phase_c = angle(c);

real_d = real(d);
imag_d = imag(d);
norm_d = abs(d);
phase_d = angle(d);

% created 4x2 matrix to store values calculated above
B = [real_c, real_d; imag_c, imag_d; norm_c, norm_d; phase_c, phase_d]; 


%% 3.

% created 4x1 matrix that has the sum of each row of matrix B as entries 
mat_in_num3 = sum(B, 2);


%% 4. 

mat_AB = A*B;                   % part a
C = repmat(A, 2, 1);            % part b
partC = C.'-B;                  % part c
partD = C.'.*B;                 % part d
partE = (C*B).^2;               % part e
partF = (C*B)^2;                % part f
partG = det((C*B)-(2*eye(2)));  % part g


%% 5. 

vect_5000 = linspace(pi,exp(1),5000);   % 5000 element vector from pi to e 
vect_freq = 0:(1/7e6):2;                % 7 MHz for 2 seconds vector


%% 6. 

% optional broadcasting problem
y = linspace(-10,10,101);
x = y.';
z = x.^2 + y.^2 - 4; 