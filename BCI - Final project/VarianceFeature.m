function [VARC3,VARC4] = VarianceFeature(C3 ,C4 ,starTimeVARC3 ,starTimeVARC4 ,totalTrialTime,dataBase)

if(size(dataBase,2) ~= 1)
    % for extracting data from the test
    ResultC4 = std((dataBase(:,starTimeVARC4:totalTrialTime,C4)'));
    ResultC3 = std((dataBase(:,starTimeVARC3:totalTrialTime,C3)'));
else
    ResultC4 = std((dataBase.data(:,starTimeVARC4:totalTrialTime,C4)'));
    ResultC3 = std((dataBase.data(:,starTimeVARC3:totalTrialTime,C3)'));
end


VARC3 = ResultC3.^2;
VARC4 = ResultC4.^2;
