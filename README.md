# Recreation of Discreet Music by Brian Eno
# Assignement 6 of MUSI 6003
# Group 5: Yongliang He, Yanchao Liu, Jiawen Huang
# Github Respository: https://github.com/YongliangHe/DiscreetMusicRecreation

If you want to run the code and listen to the recreated piece, simply run main.m in MATLAB.

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
		
5. Create Noise:
	
	noise = randn(size(x_delay, 1), 2)/100;

6. Listen to it!
	
	sound(x_delay + noise, fs);
