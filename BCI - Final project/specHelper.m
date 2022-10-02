function [Stotal] = specHelper(indecesHandLabels,electrode,sizeOfWindowSPEC,nOverLapSPEC,nOfTrialsPerHand,range,samplingRate,f,dataBase)

Stotal = 0;
if(strcmp(range,'all'))
    rangeOfcalc = ':';
else
    rangeOfcalc = 1:2*samplingRate;
end
for i = 1:nOfTrialsPerHand
    [s1] = spectrogram(dataBase.data(indecesHandLabels(i),rangeOfcalc,electrode), ...
        sizeOfWindowSPEC,nOverLapSPEC,f,samplingRate);
    Stotal = Stotal + 10*log10((abs(s1)).^2);
end

