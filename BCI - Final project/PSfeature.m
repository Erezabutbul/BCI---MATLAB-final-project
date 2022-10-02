function [PSstdC3,PSstdC4,PSmeanC3,PSmeanC4] = PSfeature(rightHandLabeled,leftHandLabeled,startTimeImagination,totalTrialTime,C3,C4,sizeOfWindowPwelch,nOverLapPwelch,numberOfTrials,startTimePSfeature,samplingRate,sizeOfPwelchVec,dataBase)

% PSC3 = zeros(391,128);
% PSC4 = zeros(391,128);
pxxTOTALC3 = zeros(numberOfTrials,sizeOfPwelchVec);
pxxTOTALC4 = zeros(numberOfTrials,sizeOfPwelchVec);
f = (1:0.1:40);

for i = 1:numberOfTrials
%     [pxx1,PSC3] = pwelch(dataBase.data(i,590:totalTrialTime,C3)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate);
%     [pxx2,PSC4] = pwelch(dataBase.data(i,590:totalTrialTime,C4)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate);
    
    if(size(dataBase,2) ~= 1)
        [pxx1,~] = pwelch(dataBase(i,startTimePSfeature:totalTrialTime,C3)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate);
        pxxTOTALC3(i,:) = pxx1;
        [pxx2,~] = pwelch(dataBase(i,startTimePSfeature:totalTrialTime,C4)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate);
        pxxTOTALC4(i,:) = pxx2;
    else
        [pxx1,~] = pwelch(dataBase.data(i,startTimePSfeature:totalTrialTime,C3)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate);
        pxxTOTALC3(i,:) = pxx1;
        [pxx2,~] = pwelch(dataBase.data(i,startTimePSfeature:totalTrialTime,C4)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate);
        pxxTOTALC4(i,:) = pxx2;
    end
end

PSstdC3 = std(pxxTOTALC3');
PSstdC4 = std(pxxTOTALC4');
PSmeanC3 = mean(pxxTOTALC3,2);
PSmeanC4 = mean(pxxTOTALC4,2);




%% in case the user wants to see the feature's histograms

% [pxx1,PSRC3] = pwelch(dataBase.data(rightHandLabeled,startTimeImagination:totalTrialTime,C3)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate);
% [pxx2,PSRC4] = pwelch(dataBase.data(rightHandLabeled,startTimeImagination:totalTrialTime,C4)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate);
% [pxx3,PSLC3] = pwelch(dataBase.data(leftHandLabeled,startTimeImagination:totalTrialTime,C3)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate);
% [pxx4,PSLC4] = pwelch(dataBase.data(leftHandLabeled,startTimeImagination:totalTrialTime,C4)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate);
% 
% 
% figure
% histogram(pxx1(PSRC4(120:210)))
% hold on
% histogram(pxx4(PSLC4(120:210)))
% legend("RightC4","LeftC4")
% 
% figure
% histogram(PSRC3)
% hold on
% histogram(PSLC3)
% legend("RightC3","LeftC3")