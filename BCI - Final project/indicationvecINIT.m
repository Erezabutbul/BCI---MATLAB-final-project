function [indicationVec] = indicationvecINIT(numberOfTrials,leftAttribute,dataBase)

    indicationVec = zeros(numberOfTrials,1);
    % 0 - indication of right hand
    % 1 - indication of left hand
    for i = 1:numberOfTrials
        if(dataBase.attribute(leftAttribute,i) == 0)
            indicationVec(i,1) = 0;
        else
            indicationVec(i,1) = 1;
        end
    end