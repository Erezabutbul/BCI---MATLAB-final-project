function [] = SpectrogramVisualization(StotalR3,StotalL3,StotalR4,StotalL4,nTrialsRight,nTrialsLeft,fontSize,titleFontSize)

figure
subplot(2,2,1)
plotSPEC(StotalR3,"C3 Right",'Times (s)','Frequency (Hz)',nTrialsRight,fontSize,titleFontSize)
subplot(2,2,2)
plotSPEC(StotalL3,"C3 Left",'Times (s)','Frequency (Hz)',nTrialsLeft,fontSize,titleFontSize)
subplot(2,2,3)
plotSPEC(StotalR4,"C4 Right",'Times (s)','Frequency (Hz)',nTrialsRight,fontSize,titleFontSize)
subplot(2,2,4)
plotSPEC(StotalL4,"C4 Left",'Times (s)','Frequency (Hz)',nTrialsLeft,fontSize,titleFontSize)
sgtitle("Spectrograms",'FontSize', titleFontSize, 'FontName', 'David')


if(nTrialsLeft == nTrialsRight)
    % visualization of deduction spectrogram
    figure
    subplot(2,1,1)
    plotSPEC(StotalR3 - StotalL3,"C3 Right - Left",'Times (s)','Frequency (Hz)',nTrialsRight + nTrialsLeft,fontSize,titleFontSize)
    subplot(2,1,2)
    plotSPEC(StotalR4 - StotalL4,"C4 Right - Left",'Times (s)','Frequency (Hz)',nTrialsRight + nTrialsLeft,fontSize,titleFontSize)
    sgtitle("Spectrograms normal deduction",'FontSize', fontSize*2, 'FontName', 'David')
end