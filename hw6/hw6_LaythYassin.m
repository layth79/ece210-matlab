% Layth Yassin                      Hw#6                        ECE-210-B
clc; clear; close all;

%% 1. 
% part a
b1 = [0 (3/7) (2/3) (1/2)];
a1 = [(1/2) 0 (1/3) 3];

% part b
figure;
zplane(b1, a1); % has zero at infinity
title("Poles and Zeros Plot of System 1"); 
% ROC I: |z| < 1.69, causal: No, stable: Yes
% ROC II: 1.69 < |z| < 1.88, causal: No, stable: No
% ROC III: 1.88 < |z| <= infinity, causal: Yes, stable: no

% part c
[z1, p1, k1] = tf2zp(b1, a1); % computes the zeros, poles and gain of the
% system. These zeros and poles match what I saw in the plot

% part d
[h, t] = impz(b1, a1, 32); % computes first 32 samples of impulse 
% response of transfer function

% part e
n1 = (0:63);
x1 = (-5/6).^n1;
% i.
y1 = filter(b1, a1, x1);
% ii.
y2 = conv(x1, h);
y2 = y2(1:64);

%% 2.
% part a
k2 = 0.0863;
z2 = [(1+1i*2.056); (1-1i*2.056); (1+1i*1.4261); (1-1i*1.4261)];
p2 = [(0.7375+1i*0.7601); (0.7375-1i*0.7601); (0.9589+1i*1.2360); ...
     (0.9589-1i*1.2360)];
[b2, a2] = zp2tf(z2, p2, k2);

% part b
figure;
zplane(b2, a2);
title("Poles and Zeros Plot of System 2");

% part c
[H, w] = freqz(b2, a2);

% part d
Hdb = 20 * log10(abs(H)); % conversion of magnitude gain to decibels

figure;
subplot(2,1,1);
plot(w, Hdb);
xlabel("Frequency (rads)");
ylabel("|H| (dB)");
xlim([0 pi]);
xticks([0 pi/2 pi]);
xticklabels({'0', '\pi/2', '\pi'});
title("Magnitude Response");

Hph = rad2deg(unwrap(angle(H))); % phase of H
subplot(2,1,2);
plot(w,Hph);
xlabel("Frequency (rads)");
ylabel("Phase (degrees)");
xlim([0 pi]);
xticks([0 pi/2 pi]);
xticklabels({'0', '\pi/2', '\pi'});
title("Phase Response");

% part e
% It is a band-pass filter. We can also tell from the pole-zero plot since
% there are poles that are symmetric over the real axis
