function x_delay = audioDelay(x, fs, delay, gain)
% x: audio signal
% fs: sampling rate
% delay: delay time, in sample, default 6 (seconds) * fs
% gain: feedback rate, default 0.75

delay_num = ceil(log(0.01)/log(gain));
orig_len = size(x, 1);
x_delay = zeros(delay_num * delay + orig_len, 2);
x_delay(1:orig_len, :) = x;
for i = 1:delay_num
    x_delay(i*delay+1:i*delay+orig_len, :) = x_delay(i*delay+1:i*delay+orig_len, :) + (gain^i) * x;
end

% sound(x_delay, fs);