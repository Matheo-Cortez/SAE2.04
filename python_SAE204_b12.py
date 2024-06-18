import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

CollegesDF = pd.read_csv("/home/etuinfo/bperiaut/Documents/1B1/S2/sae2_04/partie3/python/Colleges.csv", delimiter = ";")
CollegesDF = CollegesDF.dropna()


collegeAr = np.array(CollegesDF)

def Centreduire(T):
    T=np.array(T,dtype=np.float64)
    (n,p) = T.shape
    Res = np.zeros((n,p))
    TMoy = np.mean(T, axis=0)
    TEcart = np.std(T, axis=0)
    for j in range(p):
        Res[:,j] = (T[:, j] - TMoy[j])/TEcart[j]
    return Res

collegeAr_CR = Centreduire(collegeAr)

def DiagBatons(Colonne):
    m = min(Colonne)# m contient la valeur minimale de la colonne
    M = max(Colonne)# M contient la valeur maximale de la colonne
    inter = np.linspace(m,M, num=30) # liste de 21 valeurs allant de m `a M. On
    # peut utiliser la fonction np.linspace
    plt.figure()
    plt.hist(Colonne,inter,histtype='bar',align='left',rwidth=0.75)
    plt.show()

# print(np.cov(collegeAr_CR,rowvar=False))

Y = collegeAr[:, 0]        
X = collegeAr[:, 1:] 

linear_regression = LinearRegression()
linear_regression.fit(X, Y)
a=linear_regression.coef_

CorC=linear_regression.score(X,Y)
print(CorC)