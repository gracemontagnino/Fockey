function plot_frequency(yaw)
% this function plots the given yawin the frequency domain by
% taking the fft.
% Used for determining the speed and consistency of frequency of the drill
% (higher frequency value = greater speed && fewer peaks = more consistant

    yaw(isnan(yaw)) = [];
    fyaw = fft(yaw);
    
    figure
    plot(fftshift(abs(fyaw)),'g')
    title('Yaw')
    xlabel('Frequency (Hz)')
    ylabel('Amplitude')
end