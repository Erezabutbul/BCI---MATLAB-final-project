function [highCloudC3,highCloudC4] = highCloud(rightHandLabeled,leftHandLabeled,startTimeHighCloud,endTimeHighCloud,samplingRate,C3,C4,dataBase)


if(size(dataBase,2) ~= 1)
    ResultC4 = bandpower(dataBase(:, startTimeHighCloud:endTimeHighCloud, C4)',samplingRate,[32 34]);
    ResultC3 = bandpower(dataBase(:, startTimeHighCloud:endTimeHighCloud, C3)',samplingRate,[32 34]);
else
    ResultC4 = bandpower(dataBase.data(:, startTimeHighCloud:endTimeHighCloud, C4)',samplingRate,[32 34]);
    ResultC3 = bandpower(dataBase.data(:, startTimeHighCloud:endTimeHighCloud, C3)',samplingRate,[32 34]);
end

highCloudC3 = 10*log10(ResultC3);
highCloudC4 = 10*log10(ResultC4);


%% in case the user wants to see the feature's histograms

% rC3 = bandpower(dataBase.data(rightHandLabeled, 630:730, C3)',128,[32 34]);
% lC3 = bandpower(dataBase.data(leftHandLabeled, 630:730, C3)',128,[32 34]);
% 
% rC4 = bandpower(dataBase.data(rightHandLabeled, 675:740, C4)',128,[32 33]);
% lC4 = bandpower(dataBase.data(leftHandLabeled, 675:740, C4)',128,[32 33]);
% 
% As in freq18
% highCloudC3(rightHandLabeled) = rC3;
% highCloudC3(leftHandLabeled) = lC3;
% highCloudC4(rightHandLabeled) = rC4;
% highCloudC4(leftHandLabeled) = lC4;

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



