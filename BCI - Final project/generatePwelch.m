function [PSRC3,PSRC4,PSLC3,PSLC4] = generatePwelch(rightHandLabeled,leftHandLabeled,startTimeImagination,totalTrialTime,C3,C4,samplingRate,sizeOfWindowPwelch,nOverLapPwelch,nTrialsRight,nTrialsLeft,sizeOfPwelchVec,f,fontSize,titleFontSize,dataBase)

% doc
% Extracting and presenting Pwelch for each class (L, R) 
% and each electrode (C4,C3)
% the calculation is done for each trial and being avg at the end


PSRC3 = zeros(nTrialsRight,sizeOfPwelchVec);
PSRC4 = zeros(nTrialsRight,sizeOfPwelchVec);
PSLC3 = zeros(nTrialsLeft,sizeOfPwelchVec);
PSLC4 = zeros(nTrialsLeft,sizeOfPwelchVec);
pxxLeftC3Vec = zeros(nTrialsLeft,sizeOfPwelchVec,nTrialsLeft);
pxxRightC3Vec = zeros(nTrialsRight,sizeOfPwelchVec,nTrialsRight);
pxxLeftC4Vec = zeros(nTrialsLeft,sizeOfPwelchVec,nTrialsLeft);
pxxRightC4Vec = zeros(nTrialsRight,sizeOfPwelchVec,nTrialsRight);
pxxCCLeftC3Vec = zeros(nTrialsLeft,sizeOfPwelchVec,2);
pxxCCRightC3Vec = zeros(nTrialsRight,sizeOfPwelchVec,2);
pxxCCLeftC4Vec = zeros(nTrialsLeft,sizeOfPwelchVec,2);
pxxCCRightC4Vec = zeros(nTrialsRight,sizeOfPwelchVec,2);


for i = 1:nTrialsLeft
    [pxxLeftC3Vec(i,:,i),PSLC3(i,:,:),pxxCCLeftC3Vec(i,:,:)] = pwelch(dataBase.data(leftHandLabeled(i),startTimeImagination:totalTrialTime,C3)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate,"ConfidenceLevel",0.95);
    [pxxLeftC4Vec(i,:,i),PSLC4(i,:,:),pxxCCLeftC4Vec(i,:,:)] = pwelch(dataBase.data(leftHandLabeled(i),startTimeImagination:totalTrialTime,C4)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate,"ConfidenceLevel",0.95);

end

for i = 1:nTrialsRight
    [pxxRightC3Vec(i,:,i),PSRC3(i,:,:),pxxCCRightC3Vec(i,:,:)] = pwelch(dataBase.data(rightHandLabeled(i),startTimeImagination:totalTrialTime,C3)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate,"ConfidenceLevel",0.95);
    [pxxRightC4Vec(i,:,i),PSRC4(i,:,:),pxxCCRightC4Vec(i,:,:)] = pwelch(dataBase.data(rightHandLabeled(i),startTimeImagination:totalTrialTime,C4)',sizeOfWindowPwelch,nOverLapPwelch,f,samplingRate,"ConfidenceLevel",0.95);
end

tmp = mean(pxxLeftC3Vec);
pxxLeftC3VecMEAN = 10*log10(mean(tmp,3));

tmp = mean(pxxLeftC4Vec);
pxxLeftC4VecMEAN = 10*log10(mean(tmp,3));

tmp = mean(pxxRightC3Vec);
pxxRightC3VecMEAN = 10*log10(mean(tmp,3));

tmp = mean(pxxRightC4Vec);
pxxRightC4VecMEAN = 10*log10(mean(tmp,3));

PSRC3 = mean(PSRC3);
PSRC4 = mean(PSRC4);
PSLC3 = mean(PSLC3);
PSLC4 = mean(PSLC4);

pxxCCLeftC3Vec = (squeeze(10*log10(mean(pxxCCLeftC3Vec))));
pxxCCLeftC4Vec = (squeeze(10*log10(mean(pxxCCLeftC4Vec))));
pxxCCRightC3Vec = (squeeze(10*log10(mean(pxxCCRightC3Vec))));
pxxCCRightC4Vec = (squeeze(10*log10(mean(pxxCCRightC4Vec))));

% plot the data

figure
subplot(2,1,1)
sgtitle("Average Power Spectra across trails",'FontSize', titleFontSize, 'FontName', 'David')
plot(PSRC3,pxxRightC3VecMEAN,"Color",'r')
hold on
plot(PSRC3,pxxCCRightC3Vec - 20,'-.',"Color",'r')
xlabel('Frequency (Hz)','FontSize', fontSize, 'FontName', 'David')
ylabel('PSD (dB/Hz)','FontSize', fontSize, 'FontName', 'David')
title('C3 Electrode','FontSize', fontSize, 'FontName', 'David')
hold on
plot(PSLC3,pxxLeftC3VecMEAN,"Color",'b')
hold on
plot(PSLC3,pxxCCLeftC3Vec - 20,':',"Color",'b')

legend("Right hand labeled", ...
    "Right hand labeled upper bound", ...
    "Right hand labeled lower bound", ...
    "Left hand labeled", ...
    "Left hand labeled upper bound", ...
    "Left hand labeled lower bound")

subplot(2,1,2)
plot(PSRC4,pxxRightC4VecMEAN,"Color",'r')
hold on
plot(PSRC4,pxxCCRightC4Vec - 20,'-.',"Color",'r')

xlabel('Frequency (Hz)','FontSize', fontSize, 'FontName', 'David')
ylabel('PSD (dB/Hz)','FontSize', fontSize, 'FontName', 'David')
title('C4 Electrode','FontSize', fontSize, 'FontName', 'David')
hold on
plot(PSLC4,pxxLeftC4VecMEAN,"Color",'b')
hold on
plot(PSLC4,pxxCCLeftC4Vec - 20,':',"Color",'b')

legend("Right hand labeled", ...
    "Right hand labeled upper bound", ...
    "Right hand labeled lower bound", ...
    "Left hand labeled", ...
    "Left hand labeled upper bound", ...
    "Left hand labeled lower bound")
enlarge()




