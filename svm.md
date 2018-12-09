# 2 SVM

建立模型：
$$
\begin{aligned}
&min \quad\frac{1}{2}\Vert\omega\Vert+c\sum_{i=1}^n\xi_i\\
&s.t \quad y_i(\omega\ x_i+b)\ge1-\xi_i\\
&\qquad\xi_i\ge0\qquad i=1,2,\cdots, n
\end{aligned}
$$
其中，$(x_i, y_i)$是训练样本，$\xi_i$是松弛变量，$\omega, b$确定了分类超平面。将式转化成 `linprog(f,A,b,Aeq,beq,lb,ub)` 调用的形式。可以从样本点的分布观察，或者假设$w_i$全是正的，从试运行结果得出$w_1$是负，所以$w_1$乘$-1$。并选取 $c=1$。
$$
\begin{aligned}
&min \quad-\omega_1+\omega_2+\sum_{i=1}^n\xi_i\\
&s.t \quad y_i\ x_i\ \omega_1+y_i\ x_i\ \omega_2\ +y_i\ b+\xi_i\ge1\\
&\qquad\qquad\xi_i\ge0\qquad i=1,2,\cdots, n
\end{aligned}
$$
约束条件转化为矩阵形式：
$$
\begin{aligned}
&s.t \quad \begin{bmatrix}y_1x_1&y_1x_1&y_1&1&\cdots&1\\y_2x_2&y_2x_2&y_2&1&\cdots&1\\\vdots&&\vdots\\y_{2500} x_{2500}&y_{2500}x_{2500}&y_{2500}&1&\cdots&1\end{bmatrix}\begin{bmatrix}\omega_1\\\omega_2\\b\\\pmb\xi\end{bmatrix}\le\begin{bmatrix}1\\\vdots\\1\end{bmatrix}\\
&\qquad\qquad\qquad\qquad\pmb\xi\ge0\qquad
\end{aligned}
$$

运行结果：