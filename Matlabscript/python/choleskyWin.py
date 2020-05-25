#!/usr/bin/env python

#Progetto 1 Cholensky
import scipy.io 
#import sys #da togliere, creare una funzione che richiama tutte matrici e le elabora
import numpy as np
from cvxopt import cholmod, spmatrix, sparse, matrix as MTR
import time
from numpy import linalg as lg
import csv


#nome delle matrici da analizare
names = ["ex15","cfd1","shallow_water1","cfd2","parabolic_fem","apache2","G3_circuit"]#,"Flan_1565","StocF-1465"]
#campi del dizionario per creare il csv
fields = ["Name", "Size", "Error", "Time", "Memory"]



###########memory#####################
Memory=[11, 471, 20.6, 879.3, 537.8, 1999.8, 2470.2]




#inizializzazione del file csv con i campi
with open('python-Win.csv','w') as csvfile:
    write = csv.DictWriter(csvfile, fieldnames=fields)
    write.writeheader()
k=0;
for name in names:#ciclo i nomi delle matrici per analizzarle
###################### Leggo le matrici e preparazione del programma ###################################
    name_matrix = name
    print("elaboro:",name_matrix,"\n")
    ##da inserire il persorso della cartella conteneti le matrici
    path = "C:/Users/giamm/Documents/MATLAB/MetodiProgetto/"+ name_matrix
    matrix  = scipy.io.loadmat(path)
    
    #assegno la matrice del file .mat
    A = matrix['Problem']['A'][0][0]
    #costruisco un array di risultati esatti
    size = A.shape[0]
    xe = MTR(np.ones(size))
    #calcolo termine noto ad hoc di A
    b = sparse(MTR(A*xe))#la trasformo in una matrice cvxopt e poi in una matrice sparsa
    #converto la matrice sparsa A in una matrice riconosciuta per cvxopt
    coo = A.tocoo()
    A = spmatrix(coo.data.tolist(), coo.row.tolist(), coo.col.tolist(), size=A.shape)
    ##################### Decomposizione di cholesky ####################
    print("calcolo x")
    t_start= time.time()
    x = cholmod.splinsolve(A,b)
    t_finish = time.time()
    t_esecution=t_finish-t_start
    #print(t_esecution)
    #################### Calcolo errore relativo ######################
    #di default la funzione compie la norma euclidea
    relative_error = lg.norm(xe-x)/lg.norm(xe)
    #print(relative_error)

    ################## Scrivo file csv #########################
    with open('python-Win.csv','a') as csvfile:
        write = csv.DictWriter(csvfile, fieldnames=fields)
        #fields = ["name", "size", "error", "time"]
        write.writerow({'Name': name_matrix, 'Size':size,'Error': relative_error, 'Time':t_esecution, 'Memory': Memory[k]})
    k=k+1
    del matrix, xe, x, b, A,