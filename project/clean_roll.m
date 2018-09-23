roll(isnan(roll)) = [];

% function clean_roll(roll)

%%
count = 0;
    for ind = 1:length(roll)-1
        if or(roll(ind) > 0 & roll((ind+1)) <0, roll(ind) < 0 & roll(ind+1) > 0)
           count = count+1;
        end
    end
    
br = zeros(count,1);
gr = zeros(count,1);
bi = zeros(count,1);
gi = zeros(count,1);
%%
for step 
        for ind = 1:length(roll)-1
            if or(roll(ind) > 0 & roll((ind+1)) <0, roll(ind) < 0 & roll(ind+1) > 0)
                for ind2 = 1:count
                    ind2
                    ind
%                     bi(ind2) = ind;
%                     br(ind2) = roll(ind);
%                     gi(ind2+1) = ind+1;
%                     gr(ind2+1) = roll(ind+1);
%         else 
%             bi(ind) = [];
%             br(ind) = [];
%             gi(ind) = [];
%             gr(ind) = [];
                end
            end
       end
    
    
%     for ind = 1:length(bi)
%         if 
%     end
% end