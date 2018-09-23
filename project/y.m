attitude_rollradians(isnan(attitude_rollradians)) = [];
attitude_rollradians = -unwrap(attitude_rollradians);

attitude_yawradians(isnan(attitude_yawradians)) = [];
attitude_yawradians = unwrap(attitude_yawradians);

sample1yaw = attitude_yawradians(3270:3600);
sample2yaw = attitude_yawradians(4800:5400);
sample3yaw = attitude_yawradians(5540:5982);
samplebadyaw = attitude_yawradians(4540:4794);

sample1roll = attitude_rollradians(3270:3600);
sample2roll = attitude_rollradians(4800:5400);
sample3roll = attitude_rollradians(5540:5982);
samplebadroll = attitude_rollradians(4540:4794);

time(isnan(time)) = [];
dt = datetime(time,'ConvertFrom','posixTime','TimeZone','America/New_York');
dt.Format = 'hh:mm:ss';

t1 = datevec(dt(5540));
t2 = datevec(dt(5982));
e1 = etime(t2,t1);

t3 = datevec(dt(4540));
t4 = datevec(dt(4794));
e2 = etime(t4,t3);

duration1 = linspace(0,e1,length(sample3yaw));
duration2 = linspace(0,e2,length(samplebadyaw));
%%
subplot(2,2,1);
plot(duration1',sample3yaw,'g');
% xlim([5540 5982])
xlabel('Time (seconds)');
ylabel('Amplitude (radians)');
% title('Good Drill')
subplot(2,2,2);
plot(duration1',sample3roll,'g');
% xlim([5540 5982])
xlabel('Time (seconds)');
ylabel('Amplitude (radians)');
% title('Good Drill')

subplot(2,2,3);
plot(duration2',samplebadyaw,'b');
% xlim([4540 4794])
% title('yaw')
xlabel('Time (seconds)');
ylabel('Amplitude (radians)');
subplot(2,2,4);
plot(duration2',samplebadroll,'b');
% xlim([4540 4794])
% title('roll')
xlabel('Time (seconds)');
ylabel('Amplitude (radians)');
suptitle('Good versus Bad Drill')