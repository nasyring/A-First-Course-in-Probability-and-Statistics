# Special Discrete Distributions

## Bernoulli Distribution

$X$ is a Bernoulli random variable if it only takes values $0$ or $1$.  Denoting $p:=P(X=1)$ the PMF can be written $p(x) = p^x(1-p)^{1-x}$.  The mean and variance are easily found to be $E(X) = p$ and $V(X) = p(1-p)$.  The MGF is $M_X(t) = 1-p+pe^t$.<br><br>

The Bernoulli distribution can describe two different experiments:<br>
1. One random sample is taken from a finite population of size $N$ of $Np$ 1's and $N(1-p)$ 0's (or any binary attribute), it's value is recorded, and it is then replaced.    <br>
2. One random sample is taken, without replacement, from an infinite population of 1's and 0's in proportions of $p$ and $1-p$.

## Categorical Distribution

The categorical distribution generalizes the Bernoulli distribution to more than two values (more than two categories).  $X$ is a categorical random variable if it takes values in a finite set of integers, usually $\{1,2,\ldots,k\}$ for $k\geq 3$. Let $p_i:=P(X=i)$ so that $0\leq p_i\leq 1$ and $\sum_{i=1}^k p_i = 1$.  Note we only need specify $p_1,\ldots p_{k-1}$ and then $p_k = 1- \sum_{i=1}^{k-1}p_i$.  The categorical PMF is $
\[p(x_1,x_2,\ldots,x_{k-1}) = \prod_{i=1}^{k} p_i^{x_i} = \left\{(1-\sum_{i=1}^{k-1} p_i)^{1-\sum_{i=1}^{k-1} x_i}\right\} \prod_{i=1}^{k-1} p_i^{x_i}.\]

The categorical distribution can describe the same two types of experiments as the Bernoulli, except where the number of categories/values is now $k$ rather than $2$.

## Binomial distribution

If $X_1,X_2,\ldots, X_n$ is a random sample of $n$ Bernoulli random variables with parameter $p$, then $Y = \sum_{i=1}^n X_i$ is a Binomial random variable with PMF
\[p(y) = {n \choose y}p^y(1-p)^{n-y}, \,\, y\in \{0, 1,\ldots, n\}.\]

The easiest way to determine moments of the Binomial distribution is to consider its MGF.  Using the fact the Binomial is a sum of independent and identically distributed (same $p$) Bernoulli r.v.'s we have
\begin{align*}
E(e^{tY}) & = E(e^{t\sum X_i}) \\
& = E\left\{\prod_{i=1}^n e^{t X_i}\right\}\\
& \stackrel{ind.}{=} \prod_{i=1}^n (1-p + pe^t)\\
& = (1-p + pe^t)^n.
\end{align*}
Then, by differentiating once and twice:
\[E(Y) = npe^t(1-p + pe^t)^{n-1}|_{t=0} = np\]
\[E(Y^2) = npe^t(1-p + pe^t)^{n-1} + npe^t(n-1)pe^t((1-p + pe^t)^{n-2})|_{t=0} = np+(np)^2-np^2\]
\[V(Y) = np(1-p).\]

The Binomial distribution describes the outcomes of a repeated random sampling of Bernoulli r.v.'s.  For example, in a poll of eligible voters with a binary "yes" or "no" vote a Bernoulli random variable represents one voter's outcome/vote and a Binomial random variable represents the sum of outcomes in the entire poll of $n$ voters.  Often, rather than the sum total we are interested in the sample proportion of yes/no votes, which is the transformation $Z = Y/n$.  Probabilities of $Z$ are easily deduced from $Y$ by $P(Z = z) = P(Y = nz)$.  Likewise, $E(Z^q) = \frac{1}{n^q}E(Y)$ for positive integers $q$. For example, the mean and variance of the sample proportion is $E(Z) = p$ and $V(Z) = \frac{p(1-p)}{n}$.

## Multinomial Distribution

Let $X_i$ be a categorical random variable encoded as a binary vector in $\mathbb{R}^k$ with $\|X_i\|_1 = 1$.  That is, $X_i$ is a vector of zeroes and one 1 at the $j^{th}$ index if $X_i$ takes value $j \in \{1,\ldots, k\}$.  This is a different representation than simply taking $X_i$ equal to its category, as represented by an integer.  Then, if $X_1, X_2, \ldots, X_n$ is a random sample (a set of independent and identically distributed) categorical random variables (as represented by binary $k-$vectors), then $Y = \sum_{i=1}^n X_i$ is a Multinomial random variable.  Note $Y$ is a $k0-$vector with integer entries representing the counts of each category appearing in the random sample.  So, the Multinomial is analogous to the Binomial as the categorical is to the Bernoulli.  The PMF of $Y$ is

\[p(y_1, y_2, \ldots, y_{k}) = \frac{n!}{y_1!\times y_2!\times \cdots \times y_k!}p_1^{y_1}\times \cdots \times p_k^{y_k}\]
where $n = \sum_{i=1}^k y_i$, $p_k = 1 - \sum_{i=1}^k p_i$.

Using the representation of the Multinomial in terms of sums of categorical random variables helps in computing moments.  Let's compute the covariance of $Y_\ell$ and $Y_j$, which represent the counts of categories $\ell$ and $j$.  For each count, write $Y_j = \sum_{i=1}^nX_{ij}$, the sum of the $j^{th}$ index of the X categorical random variable vectors.  Then, 
\begin{align*}
E(Y_\ell Y_j) &= E\{(\sum_{i=1}^n X_{i\ell})(\sum_{i=1}^n X_{ij})\}\\
& = E(\sum_{i=1}^n X_{i\ell}X_{ij}) + E(\sum_{i=1,i\ne i'}^n X_{i\ell}X_{i'j})\\
& = E(0) + E(\sum_{i=1,i\ne i'}^n X_{i\ell}X_{i'j})\\
& \stackrel{ind.}{=}  \sum_{i=1,i\ne i'}^n E(X_{i\ell})E(X_{i'j})\\
& = n(n-1)p_\ell p_j.
\end{align*}
The marginal expectations are easier to compute:
\[E(Y_\ell) = E\left\{\sum_{i=1}^n X_{i\ell}\right\} = np_\ell.\]
Therefore, the covariance is
\[Cov(Y_\ell, Y_j) = -np_\ell p_j,\]
which makes sense --- for $n$ samples if there are more samples in category $\ell$ then there necessarily are fewer in category $j$, and vice versa.  <br><br>

The Multinomial distribution is special for the fact its marginal and conditional distributions are also multi/binomial.  Consider the marginal distribution of the first category count $Y_1$.  Using the total probability formula, we can compute its marginal probabilities:
\[P(Y_1 = y_1) = \sum_{\mathbb{Y}}P(Y_1 = y_1, Y_2 = y_2, Y_3 = y_3, \ldots,Y_k = y_k),\]
where $\mathbb{Y} = \{(y_2, \ldots, y_k): n-y_1 =\sum_{2}^k y_j\}$.  In other words, 
\[P(Y_1 = y_1) = P(Y_1 = y_1, \sum_2^k Y_j = n - y_1).\]
This reveals that the marginal probability of $Y_1$ is a Binomial probability---the only "categories" that matter to the computation are "1" and "not 1". Therefore, $Y_j \sim$Binomial$(n,p_j)$ for $j \in \{1,\ldots,k\}$.  <br><br>   

Given the one-dimensional marginal distributions are Binomial, we can compute the conditional PMF of $Y_2,\ldots, Y_k|Y_1 = y_1$ as the ratio of joint to marginal PMFs:

\begin{align*}
p(y_2, \ldots, y_k|y_1) &= \frac{\frac{n!}{y_1!\times \cdots \times y_k!} p_1^{y_1}\times \cdots \times p_k^{y_k}}{ \frac{n!}{y_1! (n-y_1)!} p_1^{y_1}(1-p_1)^{n-y_1}}\\
& = \frac{(n-y_1)!}{y_2!\times \cdots y_k!}\left(\frac{p_2}{1-p_1}\right)^{y_2}\times \cdots \times \left(\frac{p_k}{1-p_1}\right)^{y_k}.
\end{align*}


## Hypergeometric distribution

The Hypergeometric distribution describes sampling from a finite population without replacement.  Traditionally, the distribution describes binary outcomes, but the idea is generalizeable.<br><br>

Suppose there are $n = n_1 + n_2$ individuals, $n_1$ 1s and $n_2$ 0s.  If $k$ individuals are randomly selected without replacement, then the probability $j$ of them are 1s is
\[P(X = j) = p(j) = \frac{{n_1 \choose j}{n_2 \choose k-j}}{{n \choose k}}, \, \, 0\leq j\leq \min(k,n_1).\]

The calculations of moments of the Hypergeometric distribution requires repeated use of the Binomial Theorem, and does not provide much insight about the distribution, but the formulas for the Hypergeometric mean and variance are insightful, so we include them here.
\[E(X) = k\frac{n_1}{n}\quad V(X) = k\frac{n_1}{n}\frac{n_2}{n}\frac{n-n_1}{n-1}.\]
The mean of $X$ is very similar to the mean of a Binomial r.v.  In this case the population proportion of 1s is exactly $n_1/n$, which is analogous to $p$ in the Binomial case, so the formula is virtually the same.  On the other hand, the variance for the Hypergeometric is like $np(1-p)$ times a "correction term" $\frac{n-n_1}{n-1}$.  We can understand the correction term as accounting for the finite-ness of the population/sampling without replacement versus sampling with replacement, as in the case of a Binomial experiment.  If $n$ is large relative to $n_1$, then this term is negligible, and there is little difference between the variances of the two distributions.

<br><br>

Consider extending the hypergeometric to more than two categories.  Let $Y_1$, $Y_2$, and $Y_3$ denote the counts of observations in each of three possible categories.  These are sums of categorical random variable vectors sampled without replacement.  Then, 

\[P(Y_1 = y_1, Y_2 = y_2, Y_3 = y_3) = \frac{{n_1\choose y_1}{n_2\choose y_2}{n_3\choose y_3}}{{n \choose y}}\]
where $n = n_1+n_2+n_3$ represent the population category counts, $y_1 + y_2 + y_3 = y \leq n$, and $0\leq y_i\leq n_i$ for $i=1,2,3$.



## Negative Binomial Distribution

Let $X_1, X_2, \ldots$ represent independent, identically distributed Bernoulli r.v.'s and define $Y$ to be the number of 1's observed when the $k^{th}$ 0 is observed; $k$ is a fixed parameter.  Then, the PMF of $Y$ is
\[p(y) = {k + y - 1 \choose k-1}(1-p)^kp^{y}, \, y\geq 0.\]
We say $Y$ is a Negative Binomial r.v.  In the special case that $k=1$ $Y$ is called a Geometric r.v. and the PMF simplifies to
\[p(y) = (1-p)p^y\]
<br><br>
The Negative Binomial is closely related to the binomial distribution.  Both involve sequences of iid Bernoulli r.v.'s, but count different types of outcomes.  The Binomial counts "successes" while the Negative Binomial counts "trials" until the $k^{th}$ failure.  Notice that there is a built-in conditioning inherent in the negative binomial because we know the last trial is a failure. This accounts for the "counting term" appearing in the PMF---the last trial is fixed as a failure, so there are only the previous $k+y - 1$ trials that can be arranged in any order.  <br><br>

The Negative Binomial for $k$ "failures" can be represented as a sum of $k$ independent Geometric r.v.'s, much like the Binomial is a sum of $n$ Bernoulli r.v.'s.  This makes computing moments much simpler.  If $X$ is a Geometric r.v., then
\[E(X) = \sum_{x=0}^\infty x \, p^x (1-p) = \frac{(1-p)p}{(1-p)^2} = \frac{p}{1-p}.\]
Then, if $Y$ is Negative Binomial with parameter $k$, $E(Y) = \frac{kp}{1-p}$.  



## Poisson Distribution

Consider an experiment in which you count the number of "events" that happen since time zero to time $t>0$.  For example, you might count shooting stars from your campsite at Big Creek State Park.  This doesn't sound like other experiments we've discussed.  For one, how would you compute $P(X_t = 5)$, the chance the number of shooting stars observed by time $t$ is 5?  It's not clear how a counting argument would apply to this situation.  As we'll show below, with a few assumptions we can use a counting argument to derive this probability, and, once again, the Bernoulli distribution is key...<br><br>

For a little more structure, let's assume the following:<br>
1. If we consider a very small time interval, $(0, \delta t)$ for a fixed $t>0$ and a small number $\delta>0$ we assume no more than one event can be observed in the interval.  Essentially, this means events cannot occur *simultaneously*.  <br>
2. The probability of one event in and interval of time length $\delta t$ is proportional to $\delta t$, that is, the probability equals $\lambda \delta t$ for some constant $\lambda >0$.<br>
3. For any two disjoint time intervals, the counts of events in those two intervals are independent.
<br><br>

These assumptions allow us to make the following argument: the time interval $(0,t)$ can be partitioned into the union of disjoint intervals 
\[(0,t) = \bigcup_{j=1}^{1/\delta} ((j-1)\delta t, \, j\delta t).\]
And, the probability of $k$ events in $(0,t)$ is now a Binomial r.v.
\[``P(X = k) = {1/\delta\choose k} (\lambda \delta t)^k (1- \lambda \delta t)^{1/\delta - k}."\]
I've written the previous probability in quotes for a couple of reasons... First, since $1/\delta$ may not be an integer, it doesn't really make sense.  Second, $\delta$ is not really a constant.  Our assumption truly is that no two events happen simultaneously, which implies our treatment of intervals as Bernoulli random variables is only valid in a limiting sense as the width of the intervals is taken to be arbitrarily small.  We can incorporate this limit by evaluating the limit of the PMF in quotes above as $\delta \rightarrow 0$.  Equivalently, we can evaluate the limit of the corresponding Binomial MGF as $(1/\delta)\rightarrow \infty$, which is slightly easier.  Recall the Binomial MGF in this context is
\[M_X(u) = (1- \lambda \delta t + \lambda \delta t e^u)^{1/\delta}.\]
Then, its limit satisfies (defining $v = 1/\delta$)
\begin{align*}
\lim_{v \rightarrow \infty} \left(1+ \frac{\lambda t(e^u -1)}{v})^{v}\\
& = e^{\lambda t(e^u - 1)}
\end{align*}
using the fact $\lim_n\rightarrow \infty (1+x/n)^n = e^x.$
<br><br>
This function is the MGF of the Poisson distribution, and has corresponding PMF
\[p(x) = \frac{(\lambda t)^x e^{-\lambda t}}{x!},\, x=0,1,\ldots\]





























