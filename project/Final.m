%% Import Data
load data_yes_yes.mat

% remove NaN values
roll(isnan(roll)) = [];
yaw(isnan(yaw)) = [];
time(isnan(time)) = [];
% resolve railing at positive and negative pi
roll = -unwrap(roll);
yaw = unwrap(yaw);

%% Deal with Time 
dt = datetime(time,'ConvertFrom','posixTime','TimeZone','America/New_York');
dt.Format = 'hh:mm:ss';
t1 = datevec(dt(1));
t2 = datevec(dt(end));
e = etime(t2,t1);

duration = linspace(dt(1),dt(end),9411);
%% Select Sample
% You may need to focus on a sample of the data to analyze. To do so, 
% adjust start and finish to trim roll and yaw. Use 
% find_start&finish(roll,yaw) to visually decide on values for start and 
% finish

sample1yaw = yaw(3270:3600);
sample2yaw = yaw(4800:5400);
sample3yaw = yaw(5540:5982);
samplebadyaw = yaw(4540:4794);

sample1roll = roll(3270:3600);
sample2roll = roll(4800:5400);
sample3roll = roll(5540:5982);
samplebadroll = roll(4540:4794);

find_start_and_finish(roll,yaw,dt)
start = 1;
finish = length(roll);
[roll,yaw] = trim_entities(roll,yaw,start,finish);
%% How Consistant (in time domain)?
plot_time(roll,yaw,duration)

% DateStrings = {'2014-05-26';'2014-08-03'};
% t = datetime(DateStrings,'InputFormat','yyyy-MM-dd')
%% How Consistant (in frequency domain) and How fast?
plot_frequency(yaw)
%% How Level?
avgh = calc_h(yaw);
%% How Accurate is Stick Rotation?
[errorpeak,errorvalley] = calc_errors(roll);
%% Questions
% How can we match our video data to our times in Matlab?
% Why does graph for finding start and end look switched in the last two
% subplots?