# Statistical Estimation

## Vocabulary

We consider experiments in which a random sample of observations is taken from a population. The sampling distribution of observations is known up to the value(s) of some *population parameter(s)*.  The goal of this chapter is to study *estimation*---approximation of these unknown parameters by *statistics*, functions of the sample data.  An *estimator* is the random variable version of a statistic and has a corresponding sampling distribution.  By virtue of being called an estimator we assume this statistic is "close" to the true parameter value in some sense.  An *estimate* is a value of an estimator after the data is collected and the estimator computed; it is a fixed, non-random value.

<br><br>

For example, consider an experiment sampling $n$ iid random samples from a Normal population with unknown mean $\mu$ and variance $1$.  Here $\mu$ is the parameter we wish to estimate.  An intuitive estimator is the sample mean statistic $\overline X_n = n^{-1}\sum_{i=1}^n X_i$.  When the data is collected we refer to the calculated sample mean---the estimate of $\mu$---as lowercase $\overline x_n$.  

## Properties of Estimators

It will become apparent that estimators are not unique---there are very often several seemingly reasonable estimators for a single parameter.  Therefore we ought to be concerned with choosing the "best" estimator according to some criteria.  Different criteria will lead to different "best" estimators.

### Bias and Unbiasedness

Consider a generic parameter denoted $\theta$ and imagine an estimator for $\theta$ called $\hat\theta_n$, which is a statistic and, hence, a random variable.  We say $\hat\theta_n$ is *unbiased* if $E(\hat\theta_n)=\theta$ where the expectation is taken with respect to the sampling distribution of $\hat\theta_n$.  For example, the sample mean $\overline X_n$ is unbiased for the population mean $\mu$ (so long as the population mean exists): 
\begin{align*}
E(\overline X_n) &= E\left(n^{-1}\sum_{i=1}^n X_i\right)\\
& = n^{-1}\sum_{i=1}^n E(X_i)\\
& = n^{-1}\sum_{i=1}^n \mu\\
& = \mu.
\end{align*}
An unbiased estimator commits no systematic errors in estimating the parameter.  In contrast, a biased estimator of a univariate real-valued parameter systematically underestimates or overestimates the parameter.  Consider biased $\hat\theta_n$ such that $E(\hat\theta_n) = \theta + 1$.  We **expect** $\hat\theta_n$ to be 1 more than $\theta$---hence we expect it to overestimate.  

### Minimum Variance Unbiased Estimators

Besides a finite mean, estimators often have a finite variance.  And, intuitively, we would tend to prefer an estimator with low variance to one with high variance, particularly if both are unbiased.  If we insist on an unbiased estimator, then the "best" unbiased estimator is the unbiased estimator with smallest variance among all unbiased estimators.  <br><br>

It is not obvious how one would find the lowest variance estimator among all unbiased estimators.   One result, due to CR Rao and Harald Cramer, provides a lower bound on the variance of an unbiased estimator.  This lower bound can be checked by computing the variance of a given unbiased estimator, and, if they match, this implies the given estimator is the MVUE.  We describe this procedure below.<br><br>

Let $f(x;\theta)$ denote the density of the data and let $\theta$ denote a univariate parameter.  Let $\ell(x;\theta) := \log(f(x;\theta))$, the natural logarithm of the density.  Define the *Fisher Information* for one data point by
\[I(\theta) = E\left[\left(\frac{\partial \ell(x;\theta)}{\partial\theta}\right)^2\right].\]
The Fisher information for a random sample of size $n$ is $n$ times $I(\theta)$.  Then, Cramer and Rao showed that if $\hat\theta_n$ is unbiased, its variance cannot be smaller than
\[V(\hat\theta_n)\geq \left[nI(\theta)\right]^{-1}\]
where $\theta$ is the true parameter value.

<br><br>

Example:  Let $X_1, \ldots, X_n$ be a random sample from a normal population with variance 1 and mean $\mu$ and consider the estimator $\overline X_n$.  The logarithm of the density function is
\[\ell(f(x;\mu)) = -\log(\sqrt{2\pi}) - \tfrac12(x - \mu)^2\]
with $\mu-$derivative $x - \mu$.  Therefore, the Fisher Information is
\[I(\mu) = E[(X - \mu)^2] = 1\]
since it is, by definition, equal to the variance.  The Cramer-Rao lower bound is
\[V(\hat\theta_n)\geq \frac{1}{n},\]
and we know $V(\overline X_n) = 1/n$ so the sample mean $\overline X_n$ is, indeed, the MVUE for this experiment.


### Mean Squared Error and Bias-Variance tradeoff

As described above a common strategy is to select an unbiased estimator, preferably one with low (or the lowest) variance.  On the other hand, one may prefer a biased estimator over an unbiased one if the bias is low and there is substantial reduction in variance.  One way to choose estimators that balance bias and variance is to consider their mean squared error (MSE), defined by
\[MSE(\hat\theta_n) = E[(\hat\theta_n - \theta)^2] = Bias(\theta_n)^2 + V(\hat\theta_n).\]
It is left as an exercise to the reader to show the MSE equals the sum of estimator variance and squared bias.  For the above reasons the estimator minimizing the MSE may be preferable even to the MVUE.  

<br><br>

Example: Estimation of a normal population variance<br>
The usual variance estimator is the sample variance $S^2_n = \frac{1}{n-1}\sum_{i=1}^n (X_i - \overline X_n)^2$.  It can be checked this estimator is unbiased. And, it is a bit of a pain, but it can be shown that $V(S_n^2) = \frac{2\sigma^4}{n-1}$.  Now, consider an alternative estimator that is a constant multiple of $S^2_n$, say $c S_n^2$ for some $c>0$.  The MSE of this estimator is
\begin{align*}
MSE(cS_n^2) &= V(cS_n^2) + Bias(cS_n^2)^2\\
& = c^2\frac{2\sigma^4}{n-1} + [E(cS_n^2) - \sigma^2]^2\\
& = c^2\frac{2\sigma^4}{n-1} + (c\sigma^2 - \sigma^2)^2\\
& = c^2\frac{2\sigma^4}{n-1} + \sigma^4(c-1)^2.
\end{align*}
Differentiate w.r.t. $c$ to find
\[\frac{\partial MSE}{\partial c} = 2c \frac{2\sigma^4}{n-1} + 2(c-1)\sigma^4.\]
Set this equal to zero and solve for $c$.  We get
\[c = \frac{2\sigma^4}{\frac{4\sigma^4}{n-1} + 2\sigma^4} = \frac{n-1}{2+n-1} = \frac{n-1}{n+1}.\]
This means the minimim MSE estimator (at least among those that are multiples of $S_n^2$) is actually $\frac{1}{n+1}\sum_{i=1}^n (X_i - \overline X_n)^2$.

### Consistency

Besides avoiding systematic estimation errors and having low variance, we would expect that as more and more data is collected an estimator should get better and better---and get "closer" to the true parameter, in some sense.  This intuition is captured mathematically by *consistency*.  An estimator is consistent if for any $c>0$, however small, 
\[\lim_{n\rightarrow \infty} P(|\hat\theta_n-\theta|>c) = 0.\]
Dissecting this definition from the inside out we first note $|\hat\theta_n - \theta|$ is the random estimation error.  Then, $|\hat\theta_n-\theta|>c$ says the error is at least $c$.  Since the error is a random variable we attach a probability to the chance the error is at least $c$, which is $P(|\hat\theta_n-\theta|>c)$.  And, consistency says this probability must vanish as we accumulate data.  So, the chance of an error of any size $c$ or bigger vanishes.  Taking complements, this is equivalent to saying
\[\lim_{n\rightarrow \infty} P(|\hat\theta_n-\theta|<c) = 1,\]
which means $\hat\theta_n$ is within $c$ of $\theta$ with probability going to 1.  <br><br>

One way to show an estimator is consistent is to show it is unbiased and has variance that vanishes as $n\rightarrow 0$.  One example is the sample mean, which is unbiased and has variance $\sigma^2/n$.  Then, consistency follows by Chebyshev's inequality, which says: for any r.v. $X$ with finite mean and variance $(\mu, \sigma^2)$, 
\[P(|X - \mu|>c)\leq \frac{\sigma^2}{c^2}\]
for any $c>0$.  In the context of estimation, we have 
\[P(|\hat\theta_n - E(\hat\theta_n)|>c) \leq \frac{Var(\hat\theta_n)}{c^2}.\]
Now, suppose $\hat\theta_n$ is unbiased and its variance vanishes in $n$.  Then, the above statement says
\[P(|\hat\theta_n - \theta|>c) \leq s_n.\]
for a sequence $s_n$ satisfying $\lim_{n\rightarrow \infty} s_n = 0$.  Checking the definition we see this means $\hat\theta_n$ is consistent.  A similar argument can work for biased estimators as well, provided the bias also vanishes as $n\rightarrow\infty$.  Such estimators are called *asymptotically unbiased*.  One such example is the minimum MSE estimator of $\sigma^2$ from the previous section.  It has bias $\sigma^2(\frac{n-1}{n+1}-1)$ which has limit zero.  

## Finding estimators - Method of Moments

So far we've discussed desirable properties of estimators but not where these estimators come from.  How do we find estimators in the first place?  One strategy is based on the fact population parameters often are related to population moments.  Then, we can find estimators by replacing population moments by sample moments and referring back to the relationship between the moments and parameters.  The simplest example of the method of moments is estimation of the population mean by the sample mean.<br><br>

Example: Suppose a population is modeled as a Gamma distribution with shape and rate parameters $(\alpha, \beta)$.  The population mean is $\alpha / \beta$ and the population variance is $\alpha / \beta^2$.  This means the population second raw moment is $\alpha / \beta^2 + (\alpha / \beta)^2$.  We can estimate $(\alpha, \beta)$ by matching the sample and population raw moments as follows:
\begin{align*}
n^{-1}\sum_{i=1}^n X_i &= \alpha/\beta^2\\
n^{-1}\sum_{i=1}^n X_i^2 &= \alpha/\beta^2 + (\alpha / \beta)^2.
\end{align*}
Solving the system by substitution we have
\begin{align*}
\hat\alpha = \frac{\hat\mu_2' - \hat\mu_1'}{\hat\mu_1'}\\
\hat \beta = \sqrt{\frac{\hat\mu_2' - \hat\mu_1'}{(\hat\mu_1')^2}},
\end{align*}
where $\hat\mu_1'$ and $\hat\mu_2'$ indicate the 1st and second raw sample moments $n^{-1}\sum_{i=1}^n X_i$ and $n^{-1}\sum_{i=1}^n X_i^2$.  

<br><br>

Example: Suppose we will take a random sample of size $n$ from a continuous uniform distribution supported on the interval $(a,b)$ where the endpoints are unknown.  We know that $E(X) = \frac{a+b}{2}$ and $V(X) = \frac{(b-a)^2}{12}$ so that $E(X^2) = \frac{(b-a)^2}{12} + \frac{(a+b)^2}{4}$.  Then, we find estimators for $(a,b)$ by solving
\begin{align*}
n^{-1}\sum_{i=1}^n X_i &= \frac{a+b}{2}\\
n^{-1}\sum_{i=1}^n X_i^2 &= \frac{(b-a)^2}{12} + \frac{(a+b)^2}{4}.
\end{align*}
With some work, you should find $(\hat a, \hat b) = (\hat\mu_1' - \sqrt{3\hat\mu_2'}, \, \hat\mu_1'+\sqrt{3\hat\mu_2'})$.  That's not so intuitive... What about using the sample minimum and maximum...



## Method of Maximum Likelihood

Again consider a random sample $X_1, \ldots, X_n$ from a population synonymous with a density function $f(x;\theta)$ for an unknown parameter $\theta$.  For the time being consider only scalar $\theta$.  The *likelihood function* is the joint PDF of the data viewed as a function of the parameter, and may be treated either as a random function or as a deterministic function depending on whether the data are treates as random variables or as observed values, so pay close attention to the context. For iid data the likelihood can be written
\[L(\theta;X_1, \ldots, X_n) = \prod_{i=1}^n f(X_i;\theta).\]

For the purpose of estimating $\theta$ we view the likelihood as a deterministic function given observations.  Then, it acts as a sort of "ranking function" that provides a quantitative comparison of how well different parameter values agree with the observed data.  The idea is to select as an estimate the parameter value that maximizes the likelihood/agreement with the data.  To explain this concept of agreement with the data a bit more suppose the data come from a discrete population so that $f(x;\theta)$ is a PMF rather than a density---this makes the interpretation easier.  Then $\prod_{i=1}^n f(X_i;\theta)$ is a the probability of observing the data for a given parameter value $\theta$.  Choosing $\theta$ to maximize this probability means selecting the distribution that gives the highest probability assignment to the data that was actually observed.
<br><br>

Example: Suppose our random sample comes from an Exponential distribution with rate $\lambda$. The likelihood function equals
\begin{align*}
L(\lambda, x_1, \ldots, x_n) &= \prod_{i=1}^n \lambda^{-1}e^{-x_i/\lambda}\\
& = \lambda ^{-n}e^{-\tfrac1\lambda\sum_{i=1}^n x_i}.
\end{align*}

Take the first derivative of the likleihood with respect to $\lambda$:
\[\frac{\partial L}{\partial \lambda} = -n\lambda^{-(n+1)}e^{-\tfrac1\lambda \sum_{i=1}^n x_i} + \lambda^{-n}e^{-\tfrac1\lambda\sum_{i=1}^n x_i}\left(\lambda^{-2}\sum_{i=1}^n x_i\right)\]
Set $\tfrac{\partial L}{\partial \lambda}$ equal to zero and solve for $\lambda$ to obtain the MLE:
\begin{align*}
\frac{\partial L}{\partial \lambda} = 0 & \Rightarrow -n\lambda^{-1} + \tfrac{1}{\lambda^2}\sum_{i=1}^n x_i = 0\\
& \Rightarrow n\lambda = \sum_{i=1}^n x_i\\
& \Rightarrow \hat{\theta}_{MLE} = \overline x_n.
\end{align*}

<br>

Example: Suppose our random sample comes from a Uniform distribution on the interval $(0,\theta)$. The likelihood function equals
\begin{align*}
L(\lambda, x_1, \ldots, x_n) &= \prod_{i=1}^n \frac{1}{\theta}1(0\leq x_i\leq \theta) \\
& = \theta^{-n}\prod_{i=1}^n 1(0\leq x_i\leq \theta).
\end{align*}

We cannot simply maximize this likelihood function by taking the first derivative because the indicator functions are not everywhere differentiable w.r.t. $\theta$.  Instead, note that the function $\theta^{-n}$ is monotonically decreasing in $\theta$; so, this function prefers small $\theta$.  On the other hand, the function $\prod_{i=1}^n 1(0\leq x_i\leq \theta)$ is constant and equal to 1 so long as $\theta \geq \max_{i=1, \ldots, n} x_i$; otherwise, this function is zero and so is the likelihood (and the likelihood cannot be less than zero!).  This means we should choose $\theta = \max_{i=1, \ldots, n} x_i$ to maximize the likelihood. Therefore, the MLE of $\theta$ is $\hat\theta_{MLE} = max_{i=1, \ldots, n} x_i$.         




## Properties of MLEs

Maximum likelihood estimation is a powerful technique because it produces estimators with good properties in a wide range of settings.  These properties include consistency, asymptotic unbiasedness, asymptotic efficiency (attainment of the Cramer-Rao lower variance bound), and asymptotic normality; subject to the fulfilment of "regularity conditions".  These conditions include<br>
1. Indentifiability - the CDF $F(x; \theta)$ satisfies $\theta\ne\theta\Rightarrow F(x;\theta)\ne F(x;\theta')$ for all $x$<br>
2. The sample sapce of the PDF does not depend on $\theta$.<br>
3. The true $\theta^\star$ is not on the boundary of the domain of $\theta$.<br>
4. The PDF $f(x;\theta)$ is three-times differentiable in $\theta$, and for all $\theta$ in a neighborhood of $\theta^\star$ the function $|\frac{\partial^3}{\partial\theta^3}\log f(X;\theta)|$ is bounded by a function $M(X)$ with finite mean.<br>
5. We can differentiate $\int f(x;\theta)dx$ twice wr.t. $\theta$ by exchanging the order of integration and differentiation (limits).<br>
<br>

Some of these conditions can be weakened, depending on the property one is trying to prove, and in some cases by making more advanced arguments, but these are the conditions we will use to establish asymptotic normality below.<br><br> 

Proof sketch of asymptotic normality:<br>

Define the loglikelihood function $\ell(\theta):=\log L(\theta;X_1, \ldots, X_n)$ and expand its first derivative in Taylor series about the MLE $\hat\theta_n$ as follows:
\[\ell'(\hat\theta_n) = \ell'(\theta^\star) + (\hat\theta_n - \theta^\star)\ell''(\theta^\star) + \tfrac12(\hat\theta_n - \theta^\star)^2\ell'''(\tilde\theta),\]
where $\tilde\theta$ is some value between $\hat\theta_n$ and $\theta^\star$ by Taylor's theorem.  Rearranging terms we have
\[\sqrt{n}(\hat\theta_n - \theta^\star) = \frac{n^{-1/2}\ell'(\theta^\star)}{-n^{-1}\ell''(\theta^\star) - (2n)^{-1}(\hat\theta_n-\theta^\star)\ell'''(\tilde\theta)}.\]
The CLT implies the numerator on the RHS above converges in distribution to $N(0, I(\theta^\star))$.  The weak LLN implies the first term in the denominator converges to $I(\theta^\star)$ in probability.  By the fourth regularity condition and the weak LLN the term $\tfrac1n \ell'''(\tilde\theta)$ in the denominator converges to $E(M(X))$ and hence, is *bounded in probability*.  This term is multiplied by $(\hat\theta_n - \theta^\star)$ which converges to zero by consistency, and hence this last product term in the denominator converges to zero in probability. Together, these bounds imply
\[\sqrt{n}(\hat\theta_n - \theta^\star)\rightarrow N(0,I(\theta^\star)^{-1}).\]
We used consistency in this proof sketch, but the proof provides the additional propoerties of asymptotic unbiasedness, efficiency, and normality.






































