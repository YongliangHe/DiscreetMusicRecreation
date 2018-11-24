# Recreate Discreet Music by Brian Eno

1. Generate synthesized sound through Ableton Live and read into matlab.
	x_left, x_right: mono sounds
	fs: sampling rate
2. Generative Process:
	x_generate = generateLeftRight(x_left, x_right, fs, length);
	e.g.: generate a 30-second long segment
		x_generate = generateLeftRight(x_left, x_right, fs, 30*fs);
3. Add Reverb:
	x_reverb = audioReverb(x_generate, fs);
4. Add Delay (with long delay time):
	x_delay = audioDelay(x_reverb, fs, delay, gain);
	e.g.: set delay to 6 seconds and set gain as 0.75
		x_delay = audioDelay(x_reverb, fs, 6*fs, 0.75);
5. Listen to it!
	sound(x_delay, fs);