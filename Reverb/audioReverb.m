function x_reverb = audioReverb(x, fs)
D1 = 46;
D2 = 57;
D3 = 64;
D4 = 70;
D5 = 120;
D6 = 100;
a1 = 0.75;
a2 = 0.75;
a3 = 0.65;
a4 = 0.5;
a5 = 0.75;
a6 = 0.85;

x_reverb = zeros(size(x, 1), 2);
x_reverb(:, 1) = schroeder(x(:, 1),fs,D1,D2,D3,D4,D5,D6,a1,a2,a3,a4,a5,a6);
x_reverb(:, 2) = schroeder(x(:, 2),fs,D1,D2,D3,D4,D5,D6,a1,a2,a3,a4,a5,a6);
