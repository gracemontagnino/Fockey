%% Variables to Change
N = length(roll);
n = N/5;

s1 = 0;
e1 = n;
s2 = e1;
e2 = 2*n;
s3 = e2;
e3 = 3*n;
s4 = e3;
e4 = 4*n;
s5 = e4;
e5 = 5*n;

%% plots
figure
subplot(5,2,1);
plot(yaw,'g');
xlim([s1 e1])
title('yaw')
subplot(5,2,2);
plot(roll,'g');
xlim([s1 e1])
title('roll')

subplot(5,2,3);
plot(yaw,'magenta');
xlim([s2 e2])
title('yaw')
subplot(5,2,4);
plot(roll,'magenta');
xlim([s2 e2])
title('roll')

subplot(5,2,5);
plot(yaw,'b');
xlim([s3 e3])
title('yaw')
subplot(5,2,6);
plot(roll,'b');
xlim([s3 e3])
title('roll')

subplot(5,2,7);
plot(yaw,'r');
xlim([s4 e4])
title('yaw')
subplot(5,2,8);
plot(roll,'r');
xlim([s4 e4])
title('roll')

subplot(5,2,9);
plot(yaw,'c');
xlim([s5 e5])
title('yaw')
subplot(5,2,10);
plot(roll,'c');
xlim([s5 e5])
title('roll')