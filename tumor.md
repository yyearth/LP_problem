##  1 放射治疗优化问题

建立模型：
$$
min \sum_{i=1}^p \alpha_i + \sum_{i=1}^q \beta_i+\sum_{i=1}^r\gamma_i\\
s.t\quad \sum_{j=1}^n t_{ij}x_j\ge 85-\alpha_i\quad i=1,2,...,p\\
\qquad \sum_{j=1}^n c_{ij}x_j\le45+\beta_i\quad i=1,2,...,q\\
\qquad \sum_{j=1}^n n_{ij}x_j\le0+\gamma_i\quad  i=1,2,...,r\\
\qquad x, \alpha,\beta,\gamma\ge0
$$

其中，$p、q$和$r$分别是肿瘤、关键器官和正常组织体元数。$x$是$594\times1$决策变量向量，$\alpha_i, \beta_i, \gamma_i$ 是松弛变量。将式转化成 `linprog(f,A,b,Aeq,beq,lb,ub)` 调用的矩阵形式。选取$\alpha, \beta, \gamma$ 权重比例分别为 $5:4:1$。
$$
min\quad\begin{bmatrix}0\cdots0\quad5\cdots5\quad4\cdots4\quad1\cdots1\end{bmatrix}\begin{bmatrix}\pmb{x}\\\pmb\alpha\\\pmb\beta\\\pmb\gamma\end{bmatrix}\\
s.t\quad \begin{bmatrix}-A_T&I&\pmb{0}&\pmb{0}\\A_C&\pmb{0}&-I&\pmb{0}\\A_N&\pmb{0}&\pmb{0}&-I\end{bmatrix}\begin{bmatrix}\pmb{x}\\\pmb\alpha\\\pmb\beta\\\pmb\gamma\end{bmatrix}\le\begin{bmatrix}85\\\vdots\\85\\-45\\\vdots\\-45\\0\\\vdots\\0\end{bmatrix}\\
\pmb{x, \alpha, \beta,\gamma}\ge0
$$
其中，
$$
A_T=\{t_{ij}\},A_C=\{c_{ij}\},A_N=\{n_{ij}\}
$$

运行结果：