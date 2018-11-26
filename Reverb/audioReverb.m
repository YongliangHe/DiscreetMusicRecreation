function x_reverb = audioReverb(x, fs)
D1 = 460;
D2 = 570;
D3 = 640;
D4 = 700;
D5 = 470;
D6 = 510;
a1 = 0.85;
a2 = 0.85;
a3 = 0.85;
a4 = 0.85;
a5 = 0.95;
a6 = 0.95;

x_reverb = zeros(size(x, 1), 2);
x_reverb(:, 1) = schroeder(x(:, 1),fs,D1,D2,D3,D4,D5,D6,a1,a2,a3,a4,a5,a6);
x_reverb(:, 2) = schroeder(x(:, 2),fs,D1,D2,D3,D4,D5,D6,a1,a2,a3,a4,a5,a6);
