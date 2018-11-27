clc; clear;

addpath('./Reverb');
filename = './recreation.wav';

% 5 mins in total
LEN = 20;
DELAY = 6;
GAIN = 0.75;

[x_left, fs] = audioread('./samples/Audio 1_05.L.wav');
[x_right, fs] = audioread('./samples/Audio 1_05.R.wav');
x_generate = generateLeftRight(x_right, x_left, fs, fs*LEN);

disp('adding reverberation...')
x_reverb = audioReverb(x_generate, fs);

disp('adding delay...')
x_delay = audioDelay(x_reverb, fs, fs*DELAY, GAIN);

noise = randn(size(x_delay, 1), 2)/100;

disp('writing to audio file')
x_delay = x_delay / max(abs(x_delay(:)));
audiowrite(filename,x_delay + noise,fs);
disp('finished!')

sound(x_delay+noise, fs);