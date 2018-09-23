attitude_rollradians(isnan(attitude_rollradians)) = [];
attitude_rollradians = -unwrap(attitude_rollradians);

attitude_yawradians(isnan(attitude_yawradians)) = [];
attitude_yawradians = unwrap(attitude_yawradians);

% time(isnan(time)) = [];
% dt = datetime(time,'ConvertFrom','posixTime','TimeZone','America/New_York');
% dt.Format = 'hh:mm:ss';
% 
% t1 = datevec(dt(1));
% t2 = datevec(dt(end));
% e = etime(t2,t1);
% duration = linspace(0,189.9213,9411);
%% Raw Data
% shows consistent periods of drill
figure
subplot(2,1,1);
plot(attitude_yawradians,'g');
xlim([2000 5000])
title('yaw')
subplot(2,1,2);
plot(attitude_rollradians,'g');
xlim([2000 5000])
title('roll')

subplot(4,2,3);
plot(attitude_yawradians,'magenta');
xlim([4800 5400])
title('yaw')
subplot(4,2,4);
plot(attitude_rollradians,'magenta');
xlim([4800 5400])
title('roll')

subplot(4,2,5);
plot(attitude_yawradians,'c');
xlim([5540 5982])
title('yaw')
subplot(4,2,6);
plot(attitude_rollradians,'c');
xlim([5540 5982])
title('roll')

subplot(4,2,7);
plot(attitude_yawradians,'b');
xlim([4540 4794])
title('yaw')
subplot(4,2,8);
plot(attitude_rollradians,'b');
xlim([4540 4794])
title('roll')

%% Analysis FFT 1
% shows speed and consistency of frequency 
% (fewer peaks = more consistant && higher frequency value = greater speed)
% graphical analysis

sample1yaw = attitude_yawradians(3270:3600);
sample2yaw = attitude_yawradians(4800:5400);
sample3yaw = attitude_yawradians(5540:5982);
samplebadyaw = attitude_yawradians(4540:4794);

sample1roll = attitude_rollradians(3270:3600);
sample2roll = attitude_rollradians(4800:5400);
sample3roll = attitude_rollradians(5540:5982);
samplebadroll = attitude_rollradians(4540:4794);

time(isnan(time)) = [];

time1 = time(3270:3600);
time2 = time(4800:5400);
time3 = time(5540:5982);
timebad = time(4540:4794);

dt1 = datetime(time1,'ConvertFrom','posixTime','TimeZone','America/New_York');
dt2 = datetime(time2,'ConvertFrom','posixTime','TimeZone','America/New_York');
dt3 = datetime(time3,'ConvertFrom','posixTime','TimeZone','America/New_York');
dtbad = datetime(timebad,'ConvertFrom','posixTime','TimeZone','America/New_York');

e1 = etime(datevec(dt1(end)),datevec(dt1(1)));
e2 = etime(datevec(dt2(end)),datevec(dt2(1)));
e3 = etime(datevec(dt3(end)),datevec(dt3(1)));
ebad = etime(datevec(dtbad(end)),datevec(dtbad(1)));

N1 = length(sample1yaw);
N2 = length(sample2yaw);
N3 = length(sample3yaw);
Nbad = length(samplebadyaw);

fs1 = N1/e1;
fs2 = N2/e2;
fs3 = N3/e3;
fsbad = Nbad/ebad;

y1 = linspace(-fs1/2,fs1/2-fs1/N1,N1)*+fs1/N1*mod(N1,2);
y2 = linspace(-fs2/2,fs2/2-fs2/N2,N2)*+fs2/N2*mod(N2,2);
y3 = linspace(-fs3/2,fs3/2-fs3/N3,N3)*+fs3/N3*mod(N3,2);
ybad = linspace(-fsbad/2,fsbad/2-fsbad/Nbad,Nbad)*+fsbad/Nbad*mod(Nbad,2);

s1yaw = abs(fftshift(fft(sample1yaw)));
s2yaw = abs(fftshift(fft(sample2yaw)));
s3yaw = abs(fftshift(fft(sample3yaw)));
sbadyaw = abs(fftshift(fft(samplebadyaw)));

[~,I1] = sort(s1yaw,'descend');
d1 = y1(I1(3))- y1(I1(1));
[~,I2] = sort(s2yaw,'descend');
d2 = y2(I2(3))- y2(I2(1));
[~,I3] = sort(s3yaw,'descend');
d3 = y3(I3(3))- y3(I3(1));
[~,Ibad] = sort(sbadyaw,'descend');
dbad = ybad(Ibad(3))- ybad(Ibad(1));

speed1 = (d1/.125)*10;
speed2 = (d2/.125)*10;
speed3 = (d3/.125)*10;
speedbad = (dbad/.125)*10;

%% FFT plot
figure
subplot(4,1,1);
plot(y1,s1yaw,'g');
hold on; 
xlabel('Frequency (Hz)');
xlim([-.2 .2]);
ylabel('Amplitude');
title('Yaw Sample 1');

subplot(4,1,2);
plot(y2,s2yaw,'magenta');
hold on; 
xlabel('Frequency (Hz)');
xlim([-.2 .2]);
ylabel('Amplitude');
title('Yaw Sample 2');

subplot(4,1,3);
plot(y3,s3yaw,'c');
xlabel('Frequency (Hz)');
xlim([-.2 .2]);
ylabel('Amplitude');
title('Yaw Sample 3')

subplot(4,1,4);
plot(ybad,sbadyaw,'b');
xlabel('Frequency (Hz)');
xlim([-.2 .2]);
ylabel('Amplitude');
title('Bad Sample')

%% Analysis minimizing peaks and valleys
% low distance in yaw indicates straightness of line
% try to minimize avg

% Sample 1
[peakValues1, ~] = findpeaks(sample1yaw);
invertedsample1yaw = max(sample1yaw) - sample1yaw;
[valleyValues1,~] = findpeaks(invertedsample1yaw);
h1 = peakValues1 - valleyValues1;
avgh1 = mean(h1);

% Sample 2 
[peakValues2, ~] = findpeaks(sample2yaw);
invertedsample2yaw = max(sample2yaw) - sample2yaw;
[valleyValues2, ~] = findpeaks(invertedsample2yaw);
h2 = peakValues2 - valleyValues2(2:end);
avgh2 = mean(h2);

% Sample 3
[peakValues3, ~] = findpeaks(sample3yaw);
invertedsample3yaw = max(sample3yaw) - sample3yaw;
[valleyValues3, ~] = findpeaks(invertedsample3yaw);
h3 = peakValues3 - valleyValues3;
avgh3 = mean(h3(1:end-1));

% Sample Bad
[peakValuesbad, ~] = findpeaks(samplebadyaw);
invertedsamplebadyaw = max(samplebadyaw) - samplebadyaw;
[valleyValuesbad, ~] = findpeaks(invertedsamplebadyaw);
hbad = peakValuesbad(2:end) - valleyValuesbad;
avghbad = mean(abs(hbad));

levelness1 = 10 - avgh1/2*10;
levelness2 = 10 - avgh2/2*10;
levelness3 = 10 - avgh3/2*10;
levelnessbad = 10 - avghbad/2*10;
%% Analysis check amplitude 
% shows accuracy of stick turn
% try to minimize errorpeak and errorvalley

% Sample 1
[peakValues4, ~] = findpeaks(sample1roll,'SORTSTR','descend');
invertedsample1roll = -sample1roll;
[valleyValues4,~] = findpeaks(invertedsample1roll,'SORTSTR','ascend');
valleyValues4 = -valleyValues4;
avgp4 = mean(peakValues4(1:5));
avgv4 = mean(valleyValues4(end-5:end));
errorpeak4 = 3*pi/2 - avgp4;
errorvalley4 = pi/2 - avgv4;


% Sample 2 
[peakValues5, ~] = findpeaks(sample2roll,'SORTSTR','descend');
invertedsample2roll = -sample2roll;
[valleyValues5, ~] = findpeaks(invertedsample2roll,'SORTSTR','ascend');
valleyValues5 = -valleyValues5;
avgp5 = mean(peakValues5(1:5));
avgv5 = mean(valleyValues5(end-5:end));
errorpeak5 = 3*pi/2 - avgp5;
errorvalley5 = pi/2 - avgv5;

% Sample 3
[peakValues6, ~] = findpeaks(sample3roll,'SORTSTR','descend');
invertedsample3roll = -sample3roll;
[valleyValues6, ~] = findpeaks(invertedsample3roll,'SORTSTR','ascend');
valleyValues6 = -valleyValues6;
avgp6 = mean(peakValues6(1:5));
avgv6 = mean(valleyValues6(end-5:end));
errorpeak6 = 3*pi/2 - avgp6;
errorvalley6 = pi/2 - avgv6;

% Sample bad
[peakValuesbad, ~] = findpeaks(samplebadroll,'SORTSTR','descend');
invertedsamplebadroll = -samplebadroll;
[valleyValuesbad, ~] = findpeaks(invertedsamplebadroll,'SORTSTR','ascend');
valleyValuesbad = -valleyValuesbad;
avgpbad = mean(peakValuesbad(1:5));
avgvbad = mean(valleyValuesbad(end-5:end));
errorpeakbad = 3*pi/2 - avgpbad;
errorvalleybad = pi/2 - avgvbad;

cross_stick1 = 10 - (errorpeak4/7)*10;
stick_side1 = 10 - (errorvalley4/6)*10;
cross_stick2 = 10 - (errorpeak5/7)*10;
stick_side2 = 10 - (errorvalley5/6)*10;
cross_stick3 = 10 - (errorpeak6/7)*10;
stick_side3 = 10 - (errorvalley6/6)*10;
cross_stickbad = 10 - (errorpeakbad/7)*10;
stick_sidebad = 10 - (errorvalleybad/6)*10;