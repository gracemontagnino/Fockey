function plot_time(roll, yaw,duration)
% this function plots the given yaw and roll in the time domain. 
% Used to visually show how consistant the periods of the drill are
    figure
    subplot(2,1,1);
    plot(duration',yaw,'g');
    title('Yaw')
    xlabel('Time (seconds)')
    ylabel('Amplitude')
    
    subplot(2,1,2);
    plot(duration',roll,'g');
    title('Roll')
    xlabel('Time (seconds)')
    ylabel('Amplitude')
end 