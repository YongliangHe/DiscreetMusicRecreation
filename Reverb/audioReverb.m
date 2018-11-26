function x_reverb = audioReverb(x, fs)
D1 = 46;
D2 = 57;
D3 = 64;
D4 = 70;
D5 = 47;
D6 = 51;
a1 = 0.95;
a2 = 0.95;
a3 = 0.95;
a4 = 0.95;
a5 = 0.95;
a6 = 0.95;

x_reverb = zeros(size(x, 1), 2);
x_reverb(:, 1) = schroeder(x(:, 1),fs,D1,D2,D3,D4,D5,D6,a1,a2,a3,a4,a5,a6);
x_reverb(:, 2) = schroeder(x(:, 2),fs,D1,D2,D3,D4,D5,D6,a1,a2,a3,a4,a5,a6);
