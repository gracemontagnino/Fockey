attitude_rollradians(isnan(attitude_rollradians)) = [];
attitude_rollradians = -unwrap(attitude_rollradians);

attitude_yawradians(isnan(attitude_yawradians)) = [];
attitude_yawradians = unwrap(attitude_yawradians);

sample1yaw = attitude_yawradians(3270:3600);
sample2yaw = attitude_yawradians(4800:5300);
sample3yaw = attitude_yawradians(5540:5982);
samplebadyaw = attitude_yawradians(4540:4794);

sample1roll = attitude_rollradians(3270:3600);
sample2roll = attitude_rollradians(4800:5300);
sample3roll = attitude_rollradians(5540:5982);
samplebadroll = attitude_rollradians(4540:4794);

time(isnan(time)) = [];

time1 = time(3270:3600);
time2 = time(4800:5300);
time3 = time(5540:5982);
timebad = time(4540:4794);

dt1 = datetime(time1,'ConvertFrom','posixTime','TimeZone','America/New_York');
dt1.Format = 'hh:mm:ss';
dt2 = datetime(time2,'ConvertFrom','posixTime','TimeZone','America/New_York');
dt2.Format = 'hh:mm:ss';
dt3 = datetime(time3,'ConvertFrom','posixTime','TimeZone','America/New_York');
dt3.Format = 'hh:mm:ss';
dtbad = datetime(timebad,'ConvertFrom','posixTime','TimeZone','America/New_York');
dtbad.Format = 'hh:mm:ss';

e1 = etime(datevec(dt1(1)),datevec(dt1(end)));
duration1 = linspace(dt1(1),dt1(end),length(sample1roll));
e2 = etime(datevec(dt2(1)),datevec(dt2(end)));
duration2 = linspace(dt2(1),dt2(end),length(sample2roll));
e3 = etime(datevec(dt3(1)),datevec(dt3(end)));
duration3 = linspace(dt3(1),dt3(end),length(sample3roll));
ebad = etime(datevec(dtbad(1)),datevec(dtbad(end)));
durationbad = linspace(dtbad(1),dtbad(end),length(samplebadroll));
%% Create Plot for bad period length
figure
subplot(2,1,1);
plot(durationbad',samplebadyaw,'b');
xlabel('Time (seconds)')
ylabel('Yaw (radians)')
title('Yaw')
subplot(2,1,2);
plot(durationbad',samplebadroll,'g');
xlabel('Time (seconds)')
ylabel('Roll (radians)')
title('Roll')
%% Create Plot for good period length
figure
subplot(2,1,1);
plot(duration3',sample3yaw,'b');
xlabel('Time (seconds)')
ylabel('Yaw (radians)')
title('Yaw')
subplot(2,1,2);
plot(duration3',sample3roll,'g');
xlabel('Time (seconds)')
ylabel('Roll (radians)')
title('Roll')

%% Create Plot for small amplitude yaw
figure 
plot(duration1',sample1yaw,'b');
xlabel('Time (seconds)');
ylabel('Yaw (radians)');
ylim([1.2 3.125])
title('Changes in Yaw Amplitudes');

%% Create Plot for large amplitude yaw
figure 
plot(duration2',sample2yaw,'b');
xlabel('Time (seconds)');
ylabel('Yaw (radians)');
ylim([1.2 3.125])
title('Changes in Yaw Amplitudes');

%% Create Frequency Plot
N1 = length(sample1yaw);
N2 = length(sample2yaw);

fs1 = N1/e1;
fs2 = N2/e2;

y1 = linspace(-fs1/2,fs1/2-fs1/N1,N1)*+fs1/N1*mod(N1,2);
y2 = linspace(-fs2/2,fs2/2-fs2/N2,N2)*+fs2/N2*mod(N2,2);

s1yaw = abs(fftshift(fft(sample1yaw)));
s2yaw = abs(fftshift(fft(sample2yaw)));

[~,I1] = sort(s1yaw,'descend');
d1 = y1(I1(3))- y1(I1(1));
[~,I2] = sort(s2yaw,'descend');
d2 = y2(I2(3))- y2(I2(1));

speed1 = (d1/.125)*10;
speed2 = (d2/.125)*10;

figure
subplot(2,1,1);
plot(y1,s1yaw,'g');
hold on; 
xlabel('Frequency (Hz)');
xlim([-1 1]);
ylabel('Amplitude');
title('Yaw Sample 1');

subplot(2,1,2);
plot(y2,s2yaw,'magenta');
hold on; 
xlabel('Frequency (Hz)');
xlim([-1 1]);
ylabel('Amplitude');
title('Yaw Sample 2');

%% Create Plot for roll
figure 
plot(duration1',sample1roll,'b');

y1 = 3*pi/2;
line([duration1(1) duration1(end)],[y1,y1], 'Color', 'k');
y2 = 5*pi/8;
line([duration1(1) duration1(end)],[y2,y2], 'Color', 'k');

xlabel('Time (seconds)');
ylabel('Roll (radians)');
legend('Roll Angle','Cross Stick Ideal Angle','Stick Side Ideal Angle','Location','southeast')
title('Similarity to ideal roll rotations');

%% Create Plot for roll
figure 
plot(duration2',sample2roll,'b');

y1 = 3*pi/2;
line([duration2(1) duration2(end)],[y1,y1], 'Color', 'k');
y2 = 5*pi/8;
line([duration2(1) duration2(end)],[y2,y2], 'Color', 'k');

xlabel('Time (seconds)');
ylabel('Roll (radians)');
legend('Roll Angle','Cross Stick Ideal Angle','Stick Side Ideal Angle','Location','southeast')
title('Similarity to ideal roll rotations');

%% Create Scale rotation information (roll)

%% Create Scale levelness (yaw)

%% Create Scale speed
