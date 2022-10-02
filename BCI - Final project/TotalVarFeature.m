function [totalVarC3,totalVarC4] = TotalVarFeature(C3 ,C4 ,startTimeImagination,totalTrialTime,dataBase)

if(size(dataBase,2) ~= 1)
    % for extracting data from the test
    ResultC4 = std((dataBase(:,startTimeImagination:totalTrialTime,C4)'));
    ResultC3 = std((dataBase(:,startTimeImagination:totalTrialTime,C3)'));
else
    ResultC4 = std((dataBase.data(:,startTimeImagination:totalTrialTime,C4)'));
    ResultC3 = std((dataBase.data(:,startTimeImagination:totalTrialTime,C3)'));
end


totalVarC3 = ResultC3.^2;
totalVarC4 = ResultC4.^2;