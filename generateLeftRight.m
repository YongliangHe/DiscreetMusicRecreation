function x_generate = generateLeftRight(x_left, x_right, fs, length)
% generative process
% x_left, x_right, mono signal
% fs: sampling rate
% length: length of generated signal (sample)

assert(size(x_left, 2) <= 2);
assert(size(x_right, 2) <= 2);

if size(x_left, 2) == 2
    x_left = x_left(:, 1);
end
if size(x_right, 2) == 2
    x_right = x_right(:, 1);
end

% initialize the generated sound
x_generate = zeros(length, 2);

l1 = size(x_left, 1);
l2 = size(x_right, 1);
n1 = floor(length/l1);
n2 = floor(length/l2);

x_generate(1:n1*l1, 1) = repmat(x_left, n1, 1);
x_generate(1:n2*l2, 2) = repmat(x_right, n2, 1);

rem1 = length - n1*l1;
rem2 = length - n2*l2;

if rem1 > 0
    x_generate(n1*l1+1:end, 1) = x_left(1:rem1);
end
if rem2 > 0
    x_generate(n2*l2+1:end, 2) = x_right(1:rem2);
end

