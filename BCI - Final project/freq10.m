function [freq10C3,freq10C4] = freq10(rightHandLabeled,leftHandLabeled,startTimeFreq10,totalTrialTime,endTimefreq10C4,samplingRate,C3,C4,dataBase)



if(size(dataBase,2) ~= 1)
    ResultC3 = bandpower(dataBase(:, startTimeFreq10:totalTrialTime, C3)',samplingRate,[9 10]);
    ResultC4 = bandpower(dataBase(:, startTimeFreq10:endTimefreq10C4, C4)',samplingRate,[9 10]);
else
    ResultC3 = bandpower(dataBase.data(:, startTimeFreq10:totalTrialTime, C3)',samplingRate,[9 10]);
    ResultC4 = bandpower(dataBase.data(:, startTimeFreq10:endTimefreq10C4, C4)',samplingRate,[9 10]);
end


freq10C3 = 10*log10(ResultC3);
freq10C4 = 10*log10(ResultC4);







%% in case the user wants to see the feature's histograms

% 
% rC3 = bandpower(dataBase.data(rightHandLabeled, 652:768, C3)',128,[9 10]);
% lC3 = bandpower(dataBase.data(leftHandLabeled, 652:768, C3)',128,[9 10]);
% 
% rC4 = bandpower(dataBase.data(rightHandLabeled, 652:740, C4)',128,[9 10]);
% lC4 = bandpower(dataBase.data(leftHandLabeled, 652:740, C4)',128,[9 10]);
% 
% 
% 
% figure
% title("C4 - C3 histogram")
% histogram((rC4 - rC3).^2)
% hold on
% histogram((lC4 - lC3).^2)
% legend("rC4 - rC3","lC4 - lC3")
% 
% 
% figure
% title("C3 - C4 title")
% histogram((rC3 - rC4).^2)
% hold on
% histogram((lC3 - lC4).^2)
% legend("rC3 - rC4","lC3 - lC4")

