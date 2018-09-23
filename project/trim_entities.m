function [roll, yaw] = trim_entities(roll, yaw, start, finish)
% this function trims roll and yaw to the sample contained between the
% values start and end

    roll = roll(start:finish);
    yaw = yaw(start:finish);
end