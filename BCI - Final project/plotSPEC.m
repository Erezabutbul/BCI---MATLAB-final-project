function [] = plotSPEC(Stotal,t, x, y, nOfTrialsPerHand,fontSize,titleFontSize)


imagesc((1:6),(1:40),Stotal/nOfTrialsPerHand)
set(gca,'YDir','normal')
set(gca,'fontsize', fontSize)
title(t,'FontSize',fontSize)
xlabel(x)
ylabel(y)
colormap jet
colorbar
enlarge()
