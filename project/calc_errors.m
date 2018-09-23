function [errorpeak,errorvalley] = calc_errors(roll)
% this function finds how far the average peaks and valleys of roll are 
% from pi.
% Used to show the accuracy of stick rotation (minimize errorpeak and
% errorvalley to rotate stick by the right angle.

    peakValues, ~] = findpeaks(roll,'SORTSTR','descend');
    invertedroll = -roll;
    [valleyValues,~] = findpeaks(invertedroll,'SORTSTR','ascend');
    valleyValues = -valleyValues;
    avgp = mean(peakValues(1:5));
    avgv = mean(valleyValues(end-5:end));
    errorpeak = pi - avgp;
    errorvalley = pi + avgv;
end