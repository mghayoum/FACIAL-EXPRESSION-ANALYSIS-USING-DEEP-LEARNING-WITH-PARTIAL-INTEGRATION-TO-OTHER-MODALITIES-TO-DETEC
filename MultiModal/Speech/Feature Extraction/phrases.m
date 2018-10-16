%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multimodal Emotions Analysis
% Version : 2.0
% Date : 04.6.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [correct]= phrases(filename)
f=[];
voice=audioread(filename);
x=voice;x=x';x=x(1,:);x=x';
y1=audioread('0.wav');
y1=y1';y1=y1(1,:);y1=y1';
z1=xcorr(x,y1);
m1=max(z1);
l1=length(z1);
t1=-((l1-1)/2):1:((l1-1)/2);
t1=t1';
hold on
%subplot(3,2,1);
plot(t1,z1);
y2=audioread('1.wav');
y2=y2';y2=y2(1,:);y2=y2';
z2=xcorr(x,y2);
m2=max(z2);
l2=length(z2);
t2=-((l2-1)/2):1:((l2-1)/2);
t2=t2';
%subplot(3,2,2);
figure
plot(t2,z2);
y3=audioread('2.wav');
y3=y3';y3=y3(1,:);y3=y3';
z3=xcorr(x,y3);
m3=max(z3);
l3=length(z3);
t3=-((l3-1)/2):1:((l3-1)/2);
t3=t3';
%subplot(3,2,3);
figure
plot(t3,z3);
y4=audioread('3.wav');
y4=y4';y4=y4(1,:);y4=y4';
z4=xcorr(x,y4);
m4=max(z4);
l4=length(z4);
t4=-((l4-1)/2):1:((l4-1)/2);
t4=t4';
%subplot(3,2,4);
figure
plot(t4,z4);
y5=audioread('4.wav');
y5=y5';y5=y5(1,:);y5=y5';
z5=xcorr(x,y5);
m5=max(z5);
f=[f, max(xcorr(y1,y1)),max(xcorr(y2,y2)),max(xcorr(y3,y3)),max(xcorr(y4,y4)),max(xcorr(y5,y5))];
l5=length(z5);
t5=-((l5-1)/2):1:((l5-1)/2);
t5=t5';
%subplot(3,2,5);
figure
plot(t5,z5);
m6=min(f);
 a=[m1 m2 m3 m4 m5];
 a1=max(a);
 if a1>f
     printf('User is wrong');
 else
     correct=(a1/m6)*100
 end
m=m6;

if     m<=m1
    soundsc(audioread('0.wav'),50000)      
elseif m<=m2
    soundsc(audioread('1.wav'),50000)      
elseif m<=m3
    soundsc(audioread('2.wav'),50000)     
elseif m<=m4
    soundsc(audioread('3.wav'),50000)        
elseif m<m5
    soundsc(audioread('4.wav'),50000)
end
hold off