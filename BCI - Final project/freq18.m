function [freq18C3,freq18C4] = freq18(C3 ,C4 ,startTimeFreq18 ,totalTrialTime,samplingRate ,dataBase)

if(size(dataBase,2) ~= 1)
    % for extracting data from the test
    ResultC4 = bandpower(dataBase(:,startTimeFreq18:totalTrialTime,C4)',samplingRate,[16 17]);
    ResultC3 = bandpower(dataBase(:,startTimeFreq18:totalTrialTime,C3)',samplingRate,[16 17]);
else
    ResultC4 = bandpower(dataBase.data(:,startTimeFreq18:totalTrialTime,C4)',samplingRate,[16 17]);
    ResultC3 = bandpower(dataBase.data(:,startTimeFreq18:totalTrialTime,C3)',samplingRate,[16 17]);
end

freq18C3 = 20*log10(ResultC3);
freq18C4 = 20*log10(ResultC4);



%% in case the user wants to see the feature's histograms

% rC4 = bandpower(dataBase.data(rightHandLabeled,startTimeFreq18:totalTrialTime,C4)',samplingRate,[16 17]);
% lC4 = bandpower(dataBase.data(leftHandLabeled,startTimeFreq18:totalTrialTime,C4)',samplingRate,[16 17]);
% rC3 = bandpower(dataBase.data(rightHandLabeled,startTimeFreq18:totalTrialTime,C3)',samplingRate,[16 17]);
% lC3 = bandpower(dataBase.data(leftHandLabeled,startTimeFreq18:totalTrialTime,C3)',samplingRate,[16 17]);
% 
% figure
% histogram(10*log10(rC4),16)
% hold on
% histogram(10*log10(lC4),16)
% legend("RightC4","LeftC4",'FontSize',fontSize)
% title('Histogram of freq18 feature','FontSize', titleFontSize, 'FontName', 'David')
% xlabel("bins", 'FontSize',fontSize, 'FontName', 'David')
% ylabel("number of occurrences", 'FontSize',fontSize, 'FontName', 'David')
% enlarge()
