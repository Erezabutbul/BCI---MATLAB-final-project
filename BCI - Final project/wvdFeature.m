function [wvdC3,wvdC4] = wvdFeature(C3 ,C4 ,startTimeFreq18 ,totalTrialTime,samplingRate,numberOfTrials ,dataBase)

startTimeFreq18 = startTimeFreq18 - 200;
ResultC4 = zeros(1,numberOfTrials);
ResultC3 = zeros(1,numberOfTrials);

for i = 1:numberOfTrials
    if(size(dataBase,2) ~= 1)
        ResultC3(i) = mean(wvd(dataBase(i,startTimeFreq18:totalTrialTime,C3),samplingRate),'all');
        ResultC4(i) = mean(wvd(dataBase(i,startTimeFreq18:totalTrialTime,C4),samplingRate),'all');
    else
        ResultC3(i) = mean(wvd(dataBase.data(i,startTimeFreq18:totalTrialTime,C3),samplingRate),'all');
        ResultC4(i) = mean(wvd(dataBase.data(i,startTimeFreq18:totalTrialTime,C4),samplingRate),'all');
    end
end



wvdC3 = 20*log10(ResultC3);
wvdC4 = 20*log10(ResultC4);



%% in case the user wants to see the feature's histograms
% 
% rC3 = zeros(size(rightHandLabeled));
% rC4 = zeros(size(rightHandLabeled));
% lC3 = zeros(size(leftHandLabeled));
% lC4 = zeros(size(leftHandLabeled));
% for i = 1:64
%     rC3(i) = mean(wvd(dataBase.data(rightHandLabeled(i), startTimeFreq18:totalTrialTime, C3)),'all');
%     lC3(i) = mean(wvd(dataBase.data(leftHandLabeled(i), startTimeFreq18:totalTrialTime, C3)),'all');
%     
%     rC4(i) = mean(wvd(dataBase.data(rightHandLabeled(i), startTimeFreq18:totalTrialTime, C4)),'all');
%     lC4(i) = mean(wvd(dataBase.data(leftHandLabeled(i),startTimeFreq18:totalTrialTime, C4)),'all');
% 
% end
% 
% 
% 
% figure
% title("C4 histogram")
% histogram(20*log10(rC4))
% hold on
% histogram(20*log10(lC4))
% legend("RightC4","LeftC4")
% 
% 
% figure
% title("C3 title")
% histogram(20*log10(rC3))
% hold on
% histogram(20*log10(lC3))
% legend("RightC3","LeftC3")
% 
