function x_reverb_mono = schroeder(x,fs,D1,D2,D3,D4,D5,D6,a1,a2,a3,a4,a5,a6)
xread = x;
FS = fs;
% [xread,FS]=audioread(indir);
x=xread(:,1);       %读取单声道数据
D1=round(D1*FS/1000);
D2=round(D2*FS/1000);
D3=round(D3*FS/1000);
D4=round(D4*FS/1000);
D5=round(D5*FS/1000);
D6=round(D6*FS/1000);
C1=[1 zeros(1,D1-1) -a1];
C2=[1 zeros(1,D2-1) -a2];
C3=[1 zeros(1,D3-1) -a3];
C4=[1 zeros(1,D4-1) -a4];
HB5=[-a5 zeros(1,D5-1) 1];
HA5=[1 zeros(1,D5-1) -a5];
HB6=[-a6 zeros(1,D6-1) 1];
HA6=[1 zeros(1,D6-1) -a6];

y1=filter(1,C1,x);
y2=filter(1,C2,x);
y3=filter(1,C3,x);
y4=filter(1,C4,x);
x5=y1+y2+y3+y4;     %4个并联梳状滤波器
y5=filter(HB5,HA5,x5);
x6=y5;
y6=filter(HB6,HA6,x6);
y=y6;               %2个串联的全通滤波器
y=y/max(y);
%z=[y,FS];
x_reverb_mono = y;
%audiowrite(OutputFileName,y,FS);
%普通对话框  
%h=dialog('name','提示.','position',[500 500 200 70]);  
  
%uicontrol('parent',h,'style','text','string','处理完成！','position',[50 40 120 20],'fontsize',12);  
%uicontrol('parent',h,'style','pushbutton','position',...  
%   [80 10 50 20],'string','确定','callback','delete(gcbf)');  

%sound(y/2,FS,NBITS);
%[xread,FS,NBITS]=wavread('/Users/gyc/Documents/MATLAB/Reverberation/Reverberation/sax_example.wav')
%y = filter(1,[1 zeros(1,46-1) -0.7],x)