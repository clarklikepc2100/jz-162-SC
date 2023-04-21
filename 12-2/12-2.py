import numpy as np
import matplotlib.pyplot as plt
def lagrange_method(x, y, k):
    n = len(x)
    L_k = 1
    for i in range(n):
        if i != k:
            L_k *= (y - x[i]) / (x[k] - x[i])
    return L_k

def cal_A(n, m):
    x = np.linspace(-1, 1, n)
    y = np.linspace(-1, 1, m)
    A = np.zeros((m, n))
    for j in range(m):
        for k in range(n):
            A[j, k] = lagrange_method(x, y[j], k)
    return A

def a_copy_to_c(A):
    m = A.shape[0]
    n = A.shape[1]
    C=np.zeros([60,60])
    for j in range(m):
        for k in range(n):
            C[j, k] = A[j, k]
    return C


n_values = np.arange(1, 31)
norm_A = np.zeros(len(n_values))


for i, n in enumerate(n_values):
    m=2*n-1
    A = cal_A(n, m)
    norm_A[i] = np.linalg.norm(A, np.inf)


#plt.semilogy(n_values, norm_A)
#plt.xlabel("n")
#plt.ylabel("||A||_inf")
#plt.title("Infinity Norm ---- A for Equispaced Interpolation")
#plt.show()

#(c)
kappa_values = np.zeros(len(n_values))
for i, n in enumerate(n_values):
    m = 2 * n - 1
    A = cal_A(n, m)
    A_square=a_copy_to_c(A)
    if(np.linalg.det(A_square)!=0):
        A_inv=np.linalg.inv(A_square)
        kappa_values[i] = np.linalg.norm(A, np.inf) * np.linalg.norm(A_inv, np.inf)

#plt.semilogy(n_values, kappa_values)
#plt.xlabel("n")
#plt.ylabel("kappa value")
#plt.title("Infinity Norm ")
#plt.show()

#(d)
n=11
# we can calculate
m = 2*n-1
A = cal_A(n, m)
A_square=a_copy_to_c(A)
if(np.linalg.det(A_square)!=0):
    c_inv = np.linalg.inv(A_square)
    print('done')






