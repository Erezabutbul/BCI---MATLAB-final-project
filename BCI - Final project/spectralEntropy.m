function [SEC3,SEC4] = spectralEntropy(rightHandLabeled,leftHandLabeled,startTimeSpectralEntropy,totalTrialTime,samplingRate ,C3,C4,numberOfTrials,dataBase)


ResultC3 = zeros(1,numberOfTrials);
ResultC4 = zeros(1,numberOfTrials);

for i = 1:numberOfTrials
    if(size(dataBase,2) ~= 1)
        ResultC3(i) = mean(pentropy(dataBase(i,startTimeSpectralEntropy:totalTrialTime,C3)',samplingRate));
        ResultC4(i) = mean(pentropy(dataBase(i,startTimeSpectralEntropy:totalTrialTime,C4)',samplingRate));
    else
        ResultC3(i) = mean(pentropy(dataBase.data(i,startTimeSpectralEntropy:totalTrialTime,C3)',samplingRate));
        ResultC4(i) = mean(pentropy(dataBase.data(i,startTimeSpectralEntropy:totalTrialTime,C4)',samplingRate));
    end
end

SEC3 = ResultC3;
SEC4 = ResultC4;


%% in case the user wants to see the feature's histograms
% rC4 = zeros(size(rightHandLabeled));
% lC4 = zeros(size(rightHandLabeled));
% rC3 = zeros(size(rightHandLabeled));
% lC3 = zeros(size(rightHandLabeled));
%     
% for i = 1 : 64
%     rC4(i) = mean(pentropy(dataBase.data(rightHandLabeled(i),256:768,C4)',128));
%     lC4(i) = mean(pentropy(dataBase.data(leftHandLabeled(i),256:768,C4)',128));
%     
%     
%     rC3(i) = mean(pentropy(dataBase.data(rightHandLabeled(i),256:768,C3)',128));
%     lC3(i) = mean(pentropy(dataBase.data(leftHandLabeled(i),256:768,C3)',128));
% end
% 


% 
% figure
% title("C4 histogram")
% histogram(rC4)
% hold on
% histogram(lC4)
% legend("RightC4","LeftC4")
% 
% 
% figure
% title("C3 title")
% histogram(rC3)
% hold on
% histogram(lC3)
% legend("RightC3","LeftC3")




