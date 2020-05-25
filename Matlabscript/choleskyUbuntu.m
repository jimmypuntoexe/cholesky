clear all
close all
clc

%estrazione matrici
matFolder = '~/Documenti/Metodi/MetodiProgetto/Matlabscript';
file = fullfile(matFolder , '*.mat'); 
matrix = dir(file);

%array per salvare i dati %ho fatto i vettori colonna solo per la tabella
%così abbiamo tutto più compatto ma si può migliorare
Name= strings(7,1);
Size=zeros(7,1);
Error=zeros(7,1);
Time=zeros(7,1);




%risoluzione di ogni matrice con Cholesky

for k = 1:length(matrix)
    load(matrix(k).name); %carico la matrice
    disp(matrix(k).name);
    Name(k)= matrix(k).name; 
    A = Problem.A; %assegno la matrice  
    n = length(A); %numero righe della matrice A
    Size(k)=n;
    xe = ones(n,1); %vettori di 1 di lunghezza n
    b=A*xe;
    tic; %inizio calcolo tempo
    x = A\b; %risolutore
    Time(k) = toc; %fine calcolo tempo;
    %accuratezza
    Error(k) = norm((x-xe)/norm(xe)); %calcolo errore relativo
    fprintf('Errore relativo -> ');
    disp(Error(k)); %mostro errore relativo
    clear matrix(k) A Problem x xe n dA b
    
end

M=[21.7 18.3 3.5 7.2 0.05 4.8 0.1];
Memory = convertmem(M);



T=sortrows(table(Name,Size,Error,Time,Memory), 'Size');

writetable(T, 'resultUbuntuGBMB.csv');













