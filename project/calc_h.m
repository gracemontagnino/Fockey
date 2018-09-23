function avgh = calc_h(yaw)
% this function finds the difference between the peaks and valleys of a
% given yaw.
% Used to determine levelness of line ball follows (minimizing avg makes
% more level line)

    [peakValues, ~] = findpeaks(yaw);
    invertedyaw = -yaw;
    [valleyValues,~] = findpeaks(invertedyaw);
    valleyValues = -valleyValues;
    if length(valleyValues) == length(peakValues)
        h = peakValues - valleyValues;
        avgh = mean(h);
    else
        if mod(length(valleyValues),length(peakValues)) ~= 0
            if length(valleyValues) > length(peakValues)
                valleyValues = valleyValues(2:end);
            elseif length(valleyValues) < length(peakValues)
                peakValues = peakValues(2:end);
            else 
                error('An Error Occured')
            end
        h = peakValues - valleyValues;
        avgh = mean(h);
        end
    end
end