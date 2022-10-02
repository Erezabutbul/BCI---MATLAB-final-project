function [] = plotVarianceHistograms(rightHandLabeled,leftHandLabeled,starTimeSTDC3,starTimeSTDC4,totalTrialTime,fontSize,titleFontSize,C3,C4,dataBase)


rC4 = std(dataBase.data(rightHandLabeled,starTimeSTDC4:totalTrialTime,C4)');
lC4 = std(dataBase.data(leftHandLabeled,starTimeSTDC4:totalTrialTime,C4)');

rC3 = std(dataBase.data(rightHandLabeled,starTimeSTDC3:totalTrialTime,C3)');
lC3 = std(dataBase.data(leftHandLabeled,starTimeSTDC3:totalTrialTime,C3)');


figure
histogram((rC4).^2)
hold on
histogram((lC4).^2)
legend("RightC4","LeftC4",'FontSize',fontSize)
title('Histogram of VARC4 feature','FontSize', titleFontSize, 'FontName', 'David')
xlabel("bins", 'FontSize',fontSize, 'FontName', 'David')
ylabel("number of occurrences", 'FontSize',fontSize, 'FontName', 'David')
enlarge()


figure
histogram((rC3).^2)
hold on
histogram((lC3).^2)
legend("RightC3","LeftC3",'FontSize',fontSize)
title('Histogram of VARC3 feature','FontSize', titleFontSize, 'FontName', 'David')
xlabel("bins", 'FontSize',fontSize, 'FontName', 'David')
ylabel("number of occurrences", 'FontSize',fontSize, 'FontName', 'David')
enlarge()