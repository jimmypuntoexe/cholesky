
%%%%%%%%%import csv%%%%%%%%%%%%%
Tubuntu = readtable('resultUbuntuGBMB.csv');
Twindows = readtable('resultWindows.csv');
TpyUbuntu = readtable("result-Cvxopt.csv");
TpyWin= readtable('python-Win.csv');


%%%%%%%%%%MATLAB UBUNUTU-WINDOWS%%%%%%%%%%%%%%%%

ticks = [10000 20000 30000 40000 50000 60000 70000];
settings = {'Linewidth', 'Marker'};
valori = {2.5, 'o'};
figure('Name', 'Matlab Ubuntu-Windows','NumberTitle','off');
YTick= [-16 -15 -12 -9 -6 -3 -1 1 3 4 ];
YTickLabels = cellstr(num2str(YTick(:), '10^{%d}'));
YTicks = (10.^YTick);

pt = semilogy(ticks,Tubuntu.Time,...
    ticks,Twindows.Time,'--',...
    ticks, Tubuntu.Error,...
    ticks, Twindows.Error, '--',...
    ticks, Tubuntu.Memory,...
    ticks, Twindows.Memory,'--');
xlim([0 80000]);
set(pt, settings, valori);
ylabel('Memoria-Errore-Tempo');
ax = gca;
ax.GridAlpha = 0.5;
xticks(ticks);
xticklabels(TpyWin.Name);
yticklabels(YTickLabels);
yticks(YTicks);
grid on
legend('Tempo Ubuntu', 'Tempo Windows', 'Errore Ubuntu',...
   'Errore Windows', 'Memoria Windows', 'Memoria Windows');
a = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',a,'fontsize',12,'FontWeight','bold')

%%%%%%%%%%%grafico Python windows%%%%%%%%%%%%%

figure('Name', 'Python Ubuntu-Windows','NumberTitle','off');

pt2 = semilogy(ticks,TpyUbuntu.Time,...
    ticks,TpyWin.Time,'--',...
    ticks, TpyUbuntu.Error,...
    ticks, TpyWin.Error,'--',...
    ticks, TpyUbuntu.Memory,...
    ticks, TpyWin.Memory,'--');
ax = gca;
ax.GridAlpha = 0.3;
xlim([0 80000]);
set(pt2, settings, valori);
ylabel('Memoria-Errore-Tempo');
xticks(ticks);
yticklabels(YTickLabels);
yticks(YTicks);
grid on
xticklabels(TpyWin.Name);
legend('Tempo Ubuntu', 'Tempo Windows', 'Errore Ubuntu',...
   'Errore Windows', 'Memoria Ubuntu', 'Memoria Windows');
a = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',a,'fontsize',12,'FontWeight','bold')

%%%%%%%%%%%grafico Memoria ubuntu win%%%%%%%%%%%%%

figure('Name', 'Memoria','NumberTitle','off');

pt4 = semilogy(ticks, Tubuntu.Memory,'--',...
    ticks, TpyUbuntu.Memory,'--',...
    ticks, TpyWin.Memory,'--',...
    ticks, Twindows.Memory,'--');
ax = gca;
ax.GridAlpha = 0.3;
xlim([0 80000]);
set(pt4, settings, valori);
ylabel('Memoria');
xticks(ticks);

grid on
xticklabels(TpyWin.Name);
legend('matlab ubuntu', 'python ubuntu','python windows', 'matlab windows');
legend('Orientation','horizontal');
a = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',a,'fontsize',12,'FontWeight','bold')

%%%%%%%%%%%grafico Memoria Windows%%%%%%%%%%%%%

figure('Name', 'Memoria Windows','NumberTitle','off');

pt5 = semilogy(ticks, TpyWin.Memory,...
    ticks, Twindows.Memory,'--');
ax = gca;
ax.GridAlpha = 0.3;
xlim([0 80000]);
set(pt5, settings, valori);
ylabel('Memoria');
xticks(ticks);
grid on
xticklabels(TpyWin.Name);
legend('Memoria python', 'Memoria Matlab');
a = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',a,'fontsize',12,'FontWeight','bold')



%%%%%%%%%%%grafico Tempo ubuntu -win%%%%%%%%%%%%%

figure('Name', 'Tempo','NumberTitle','off');

pt6 = semilogy(ticks, Tubuntu.Time,'--',...
    ticks, TpyUbuntu.Time,'--',...
    ticks, TpyWin.Time,'--',...
    ticks, Twindows.Time,'--');
ax = gca;
ax.GridAlpha = 0.3;
xlim([0 80000]);
set(pt6, settings, valori);
ylabel('Tempo');
xticks(ticks);

grid on
xticklabels(TpyWin.Name);
legend('matlab ubuntu', 'python ubuntu', 'python windows',  'matlab windows');
legend('Orientation','horizontal');
a = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',a,'fontsize',12,'FontWeight','bold')

%%%%%%%%%%%grafico Tempo Windows%%%%%%%%%%%%%

figure('Name', 'Tempo Windows','NumberTitle','off');

pt7 = semilogy(ticks, TpyWin.Time,...
    ticks, Twindows.Time,'--');
ax = gca;
ax.GridAlpha = 0.3;
xlim([0 80000]);
set(pt7, settings, valori);
ylabel('Tempo');
xticks(ticks);
grid on
xticklabels(TpyWin.Name);
legend('tempo python', 'tempo Matlab');
a = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',a,'fontsize',12,'FontWeight','bold')


%%%%%%%%%%%grafico Errore ubuntu-windows%%%%%%%%%%%%%

figure('Name', 'Errore','NumberTitle','off');

pt8 = semilogy(ticks, Tubuntu.Error,...
    ticks, TpyUbuntu.Error,'--',...
    ticks, TpyWin.Error,':',...
    ticks, Twindows.Error,'--');
ax = gca;
ax.GridAlpha = 0.3;
xlim([0 80000]);
set(pt8, settings, valori);
ylabel('Errore');
xticks(ticks);

grid on
xticklabels(TpyWin.Name);
legend('matlab ubuntu', 'python ubuntu','python windows', 'matlab windows');
legend('Orientation','horizontal');
a = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',a,'fontsize',12,'FontWeight','bold')

%%%%%%%%%%%grafico Errore Windows%%%%%%%%%%%%%

figure('Name', 'Errore Windows','NumberTitle','off');

pt9 = semilogy(ticks, TpyWin.Error,...
    ticks, Twindows.Error,'--');
ax = gca;
ax.GridAlpha = 0.3;
xlim([0 80000]);
set(pt9, settings, valori);
ylabel('Error');
xticks(ticks);
grid on
xticklabels(TpyWin.Name);
legend('errore python', 'errore matlab');

a = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',a,'fontsize',12,'FontWeight','bold')


%%%%%%%%%%%%%%tabelle dati%%%%%%%%%
%MEMORIA
Sistema = ["Ubuntu"; "Windows"];
Python = [mean(TpyUbuntu.Memory); mean(TpyWin.Memory)];
Matlab = [mean(Tubuntu.Memory); mean(Twindows.Memory)];
T = table(Sistema, Python, Matlab);
writetable(T, 'Memoria.csv');

%TEMPO
PythonT = [mean(TpyUbuntu.Time); mean(TpyWin.Time)];
MatlabT = [mean(Tubuntu.Time); mean(Twindows.Time)];
Time = table(Sistema, PythonT, MatlabT);
writetable(Time, 'Tempo.csv');

%ERRORE

PythonE = [mean(TpyUbuntu.Error); mean(TpyWin.Error)];
MatlabE = [mean(Tubuntu.Error); mean(Twindows.Error)];
Error = table(Sistema, PythonE, MatlabE);
writetable(Error, 'Errore.csv');

%MATLAB ANALISI DATI
analisi = readtable('analisi.csv');
perc= readtable('analisiSENZACoND.csv');
cond = table(analisi.Cond, perc.Nonzeri,'Coond','Nonzeri');


indexMAX =  find(Tubuntu.Memory==max(Tubuntu.Memory));
indexMIN = find(Tubuntu.Memory==min(Tubuntu.Memory));
Mmin=[min(Tubuntu.Memory); min(Twindows.Memory)];

matlabmem=[Tubuntu.Memory;Twindows.Memory];

funzioni=["Min"; "Max"; "Media"];
Valore= [max(matlabmem);...
    min(matlabmem); ...
    mean(matlabmem)];

Matrix = [TpyUbuntu.Name(indexMAX); TpyUbuntu.Name(indexMIN); " "];
Condi= ["/" ; analisi.Cond(indexMIN+2); " "];
Mem= table(funzioni, Valore, Matrix, Condi);

%tempo

indexMAX =  find(Tubuntu.Tempo==max(Tubuntu.Memory));
indexMIN = find(Tubuntu.Memory==min(Tubuntu.Memory));
Mmin=[min(Tubuntu.Memory); min(Twindows.Memory)];

matlabmem=[Tubuntu.Memory;Twindows.Memory];

funzioni=["Min"; "Max"; "Media"];
Valore= [max(matlabmem);...
    min(matlabmem); ...
    mean(matlabmem)];

Matrix = [TpyUbuntu.Name(indexMAX); TpyUbuntu.Name(indexMIN); " "];
Condi= ["/" ; analisi.Cond(indexMIN+2); " "];
Mem= table(funzioni, Valore, Matrix, Condi);
writetable(Mem, 'MatlabMem.csv');


histogram([100; 50; 30]);

