% Layth Yassin                      Hw#5                        ECE-210-B
clc; clear; close all;

%% 1.
clc; clear; close all;
load fisheriris;

[m, n] = size(meas);
cell_array = cell(m, 1);

for i = 1:m
    cell_array{i, 1} = Flower(meas(i, 1), meas(i, 2), meas(i, 3), ...
        meas(i, 4), species{i, 1});
end

% testing of getSWidth method

sWidth = cell_array{51}.getSWidth();
% logical value that equals 1 if getSWidth method is successful
test = (sWidth == meas(51, 3)); 
% part e: printing out the statement with values of object's properties
cell_array{51}.report()
