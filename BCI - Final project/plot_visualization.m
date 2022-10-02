function  [] = plot_visualization(currHandLabeled, C3,C4,dataBase,titleOfPlot,fontSize,titleFontSize)
% This function plots the labeled data from each electrode
figure;
sgtitle(titleOfPlot,'FontSize', titleFontSize, 'FontName', 'David');
hold on
% tiledlayout(4,5)
for i = 1:20
    subplot(4,5,i)
    plot(dataBase.data(currHandLabeled(i),:,C3))
    hold on
    plot(dataBase.data(currHandLabeled(i),:,C4))
    xlabel('Times (s)','FontSize', fontSize - 5, 'FontName', 'David')
    ylabel('microvolts (mV)','FontSize', fontSize - 5, 'FontName', 'David')
    L = legend("C3","C4","Location","best");
    L.FontSize = 5;
end
enlarge()