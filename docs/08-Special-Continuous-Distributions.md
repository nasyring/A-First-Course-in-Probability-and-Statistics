# Special Continuous Distributions

## Exponential Distribution

Let $Y~\sim Poisson(\lambda t)$ be a Poisson process with intensity $\lambda t$.  Let $X$ be the time until the next count/event is observed.  Then, the probability $X \geq t$ is the probability is takes at least $t$ time for the next event, has probability
\[P(X > t) = P(\text{no events in }(0,t)) = P_Y(0;t) = \frac{(\lambda t)^0 e^{-\lambda t}}{0!} = e^{-\lambda t}.\]
The CDF of $X$ then must be
\[F_X(x) = 1-P(X > x) = P(X\leq x) = 1-e^{-\lambda x},\]
and the PDF of $X$ is
\[f_X(x) = \frac{d}{dx}F_X(x) = \lambda e^{-\lambda x}, \, x\geq 0.\]

We recognize this as the PDF of an *Exponential random variable*.  This derivation provides an important connection between the Exponential and Poisson (and, ultimately, Bernoulli) distributions: the waiting times of an Poisson process (with intensity $\lambda t$) are Exponentially distributed (with mean $1/\lambda$).<br><br>

The MGF of the Exponential distribution is 

\[M_X(t) = E(e^{tX})  = \int_{0}^\infty \lambda e^{-\lambda x(1-t/\lambda)}dx\]
\[ = \frac{\lambda e^{-\lambda x(1-t/\lambda)}}{-\lambda (1-t/\lambda)}|_0^\infty\]
\[ = \frac{1}{1-t/\lambda}, \text{ provided }t < \lambda.\]


Taking derivatives:
\[\frac{d}{dt}M_X(t) = \frac{1}{\lambda(1-t/\lambda)^2}, \]
and taking $t = 0$ implies $E(X) = 1/\lambda$.
And, again,
\[\frac{d^2}{dt^2}M_X(t) = \frac{2}{\lambda^2(1-t/\lambda)^3}\]
which implies $E(X^2) = 2/\lambda^2$ and $V(X) = 1/\lambda^2$.

## Poisson Interarrival times are iid Exponential($\lambda$)

In this section we show that the subsequent times to events in a Poisson process are iid Exponential($\lambda$)-distributed.  We prove this for only the first $2$ such times, and hope the intuition is clear as to why the general case holds also.<br><br>

Let $X_1$ be the time to the first event.  We have already shown this is $Exp(\lambda)$.  Let $X_2$ be the additional (not total) time to the second event.  Our strategy is to compute the joint probability funciton $P(X_1 >x_1, X_2 >x_2)$ and note this is a product of the marginal probabilities $P(X_1 >x_1)$ and $P(X_2 >x_2)$, then we will have shown the claim.  The easiest way to do this is to first consider the total times $S_1 = X_1$ and $S_2 = X_1 + X_2$.  <br><br>

Start by writing
\begin{align*}
F_{S_1, S_2}(s_1, s_2) &= P(S_1 \leq s_1, S_2 \leq s_2)\\
& = 1 - P(S_1 > s_1, S_2 > s_2) \\
&- P(S_1 \leq s_1, S_2 > s_2)\\
&P(S_1 > s_1, S_2 \leq s_2).
\end{align*}

Now, $P(S_1 > s_1, S_2 > s_2)$ is the probability there are no events in $(0,s_1)$ and no more than 1 event in $(s_1, s_2)$.  By the definition of the Poisson process, the counts in disjoint intervals are independent, so we have
\begin{align*}
P(S_1 > s_1, S_2 > s_2) & = P(Y((0, s_1)) = 0, \, Y((s_1, s_2))\leq 1)\\
& = P(Y((0, s_1)) = 0)P(Y((s_1, s_2))\leq 1)\\
& = \frac{(\lambda s_1)^0e^{-\lambda s_1}}{0!}\times\left\{ \frac{(\lambda (s_2-s_1))^0e^{-\lambda (s_2-s_1)}}{0!}+ \frac{(\lambda (s_2-s_1))^1e^{-\lambda (s_2-s_1)}}{1!}\right\}
\end{align*}

Similar arguments show:
\[P(S_1 \leq s_1, S_2 > s_2) = \lambda s_1 e^{-\lambda s_2}.\]
\[P(S_1 > s_1, S_2 \leq s_2) = e^{-\lambda s_1} - e^{-\lambda s_2}(1+\lambda(s_2 - s_1)).\]

Then,
\[F_{S_1, S_2}(s_1, s_2) = 1-e^{-\lambda s_1} - \lambda s_1 e^{-\lambda s_2}.\]
And, by differentiating once w.r.t. $s_1$ and once w.r.t. $s_2$ we obtain
\[f_{S_1, S_2}(s_1, s_2) = \lambda^2e^{-\lambda s_2}, \, 0<s_1<s_2.\]
Next, 
\begin{align*}
P(X_1 > x_1, X_2 > x_2) &= P(S_1 > x_1, S_2-S_1 > x_2)\\
& = \int_{x_1}^\infty \int_{s_1 + x_2}^\infty \lambda^2 e^{-\lambda s_2}\,ds_2\,ds_1\\
& = e^{-\lambda x_1}e^{-\lambda x_2}.
\end{align*}
Notice this is a product of the marginal $Exp(\lambda)$ probabilities $P(X_1 > x_1) = e^{-\lambda x_1}$ and $P(X_2 > x_2) = e^{-\lambda x_2}$.  



## Gamma Distribution
Let $X_1, X_2, \ldots, X_n$ be a sequence of iid Exponential$(\lambda)$ r.v.'s.  For example, these could be the successive waiting times of the next $n$ events in a Poisson process with intensity $\lambda t$.  Then, the total waiting time for the next $n$ events is $Y = \sum_{i=1}^n X_i$.  Using the MGF method, we see
\[M_Y(t) = E(e^{tY}) = E(e^{t \sum_{i=1}^n X_i}) \stackrel{ind.}{=}\prod_{i=1}^n M_{X_i}(t)\stackrel{iid}{=}M_X(t)^n = \left(\frac{1}{1-t/\lambda}\right)^n,\]
which is the MGF of a *Gamma* random variable with two parameters: the shape (here $n$), and the rate (here $\lambda$).  The Gamma distribution has PDF
\[f_Y(y) = \frac{\lambda^n}{\Gamma(n)}y^{n-1}e^{-\lambda y},\, y>0\]
where $\Gamma(\cdot)$ denotes the "Gamma" function.  If $n$ is a positive integer $\Gamma(n) = (n-1)!$.  Note: the PDF can be derived from the MGF using the **inverse Laplace transform** but we'll not venture into these mathematical details here. <br><br>


Using the fact the Gamma r.v. is a sum of iid Exponential r.v.'s we have
\[E(Y) = n/\lambda \quad\text{and}\quad V(Y) = n/\lambda^2.\]
In general, the shape parameter $n$ need not be an integer, but if it is a fraction, then we lose the interpretation of the Gamma r.v. in terms of total waiting time.


## Normal (Gaussian) Distribution

We have already seen how a limiting case of the Binomial distribution can give rise to the Poisson distribution and describe a different type of experiment. Now, we'll explore a different kind of Binomial limiting case; specifically, consider the Bernoulli success probability $p$ to be fixed while the number of Bernoulli trials $n\rightarrow \infty$.<br><br>

The specific mathematical connection between the Binomial and Normal takes a bit of setting up.  Let $F_X(x)$ denote the cumulative mass function of a Binomial$(n,p)$ r.v.  Recall, this equals $F_X(x) = \sum_{k=0}^x {n\choose k}p^k(1-p)^{n-k}$.  Let $Y$ be the "centered and scaled" (or called "standardized") version of $X$: $Y = \frac{X - np}{\sqrt{np(1-p)}}$; this is $X$ minus its mean and divided by its standard deviation.  Let $F_Y(y)$ denote the corresponding CDF of $Y$, which equals $F_X(y\sqrt{np(1-p)}+np)$.  Let $Z$ be a *standard normal* r.v., which is a continuous r.v. with PDF \[f_Z(z) = \frac{1}{\sqrt{2\pi}}e^{-\frac{1}{2}z^2}, \, -\infty < z < \infty.\]
Denote $F_Z(z) = \int_{-\infty}^z \frac{1}{\sqrt{2\pi}}e^{-\frac{1}{2}s^2}ds$, the standard normal CDF.  Then, the Binomial distribution converges to the normal distribution in the following way:
\[\lim_{n\rightarrow\infty} F_Y(y) = F_Z(z).\]

This "convergence in distribution" from Binomial to normal is generally known as the DeMoivre-Laplace Theorem, and is a special case of the **Central Limit Theorem** proved in the next chapter---so, we'll save the proof of this result until we take up a more general version then.
<br><br>

For now, focus on the interpretation of the Binomial-Normal distribution connection rather than the precise mathematical details.  Take the example of a poll once more.  Suppose a large number, say $5000$, eligible voters are polled.  It's of little importance to compute very precise probabilities like $p(2739) = P(\text{2739 voters prefer candidate 1})$ and much more natural to quantify ranges of the sample proportion, e.g., $P(\text{between 40 and 45\% of voters prefer candidate 1})$, which is a probability statement about a continuous quantity.  The point is, when a discrete variable takes values in a very large set, its often more natural to treat it as a continuous random variable.  And, it turns out, at least in the case of the Binomial/poll, the continuous approximation is very good.

### Example: Poll and Binomial-Normal approximation

In a poll of $5000$ eligible voters from a population of voters that is split 50/50 in their preferences between two candidates, what is the probability the sample proportion of voters favoring candidate 1 is between $47\%$ and $50\%$?<br><br>

Solution:
Applying the binomial distribution we have
\[P(2350\leq X \leq 2500) = \sum_{x=2350}^{2500} {5000 \choose x}(0.5)^x(0.5)^{2500-x}.\]

Applying the normal approximation, we have $Y=\frac{X - np}{\sqrt{np(1-p)}} = \frac{X - 2500}{35.35534} \stackrel{\cdot}{\sim}N(0,1)$, and
\[P(2350\leq X \leq 2500)\approx P(-4.24261 \leq Y \leq 0).\]

Since $X$ is discrete and $Y$ is continuous, it is often suggested that a small adjustment is made to compensate for the fact $X$ takes only integer values.  This is the **continuity correction** and it has the form
\[P_X(x)\approx F_Z\left(\frac{x-np+0.5}{\sqrt{np(1-p)}}\right).\]
That is, the Binomial CDF at $x$ is approximated by the normal CDF at $z + 0.5/\sqrt{np(1-p)}$ where $z = \frac{x-np}{\sqrt{np(1-p)}}$





We can compute these probabilities using the functions $pbinom$ and $pnorm$ in R:

```r
pbinom(2500,5000,0.5)-pbinom(2349,5000,0.5)
```

```
## [1] 0.5056313
```

```r
pnorm(0) - pnorm(-4.24261)
```

```
## [1] 0.499989
```

```r
# with cty corr
pnorm(0+0.5/35.35534) - pnorm(-4.24261+0.5/35.35534)
```

```
## [1] 0.5056299
```



























