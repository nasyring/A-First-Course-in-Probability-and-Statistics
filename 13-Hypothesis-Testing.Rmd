# Hypothesis Testing

So far our discussion of statistical inference has been limited to "estimation", which is essentially any method that determines which parameter values match/agree with observed data.  We have discussed both parametric and non-parametric estimation, although we have not used those terms.  Non-parametric estimation refers to estimation of population parameters without specifying any probability model for the data.  For example, the sample mean is a reasonable estimator of the population mean (should it exist) regardless of the sampling distribution of the data (the population distribution).  Parametric estimators are tied to assumed sampling distributions.  For example, maximum likelihood estimators totally rely on an assumed sampling distribution of the data (population distribution).  Parametric estimation can be viewed as selecting which particular probability model within a given set (the assumed distribution) best fits the data.
<br><br>

We'll next expand our discussion of statistical inference to ask a different, but related question.  Instead of asking which parameters/model distributions agree with a given data set, we ask "how much evidence does a given data set provide for a particular parameter value or set of parameter values?"  The particular parameter values are referred to as the hypothesis or "null hypothesis". And, a procedure that determines whether the data provides sufficient evidence against the null hypothesis so as to make it implausible is called a "hypothesis test".   


## Notation

Consider a generic parameter $\theta$ taking values in some set $\Theta$.  The null hypothesis $\theta$ takes exactly the value $\theta_0$ is written $H_0: \theta = \theta_0$.  Its complement is the alternative hypothesis $H_a: \theta\ne\theta_0$, which is always the set complement of the null hypothesis.  In particular, $H_0: \theta = \theta_0$ is called a "point-null hypothesis" because the set in the null hypothesis consists of only a single point.  In other cases, the null hypothesis is "composite", e.g., $H_0:\theta \leq \theta_0$ versus $H_a: \theta > \theta_0$.    

Example: Suppose an experiment consist of collecting a random sample from a normal population with unknown mean $\mu$ and unknown variance $\sigma^2$.  A point null hypothesis that $\mu = 0$ is phrased $H_0: \mu = 0$ versus the alternative hypothesis $\mu \ne 0$.  A point null hypothesis that $\sigma^2 = 1$ is phrased $H_0:\sigma^2=1$ versus $H_a:\sigma^2 \ne 1$, where the alternative hypothesis tacitly assumes $\sigma^2>0$.  

## Hypothesis testing outcomes

A hypothesis testing procedure begins with a pair of null and alternative hypotheses.  Next, data relevant to the hypotheses is collected, and a decision is made as to whether the data provides sufficient evidence against the null hypothesis such that it may be rejected as implausible.  Otherwise, the data are viewed as sufficiently consistent with the null hypothesis as to retain it.<br><br>

As such, there are four possible outcomes of this procedure.  In two cases, the correct decision is made: either the null hypothesis is true and it is retained, or the null hypothesis is false and it is reject.  There are two corresponding errors:
1) A Type 1 error is committed when the null hypothesis is true but it is rejected; and,
2) A Type 2 error is committed when the null hypothesis is false and it is retained.<br><br>

Since the decision to reject or retain the null hypothesis is based on a random sample of data, the decision is itself random; so, each of these outcomes has a certain probability of occuring.  Given the null hypothesis is true, the chance of a Type 1 error occurring is denoted $\alpha$ and is also called the Type 1 error rate.  Given the null hypothesis is false the chance of a Type 2 error occurring is denoted $\beta$, and its complement, the chance of rejecting $H_0$ is denoted $1-\beta$ and referred to as the "power of the test".  <br><br>

Of course, it would be nice if one could eliminate any chance of an error occurring, but that is not possible.  To see this, consider the extreme case of a non-random hypothesis test that always rejects the null hypothesis, no matter the data.  Such a rule minimizes the chance of a Type 2 error (in fact there is such chance) but maximizes the chance of a Type 1 error.  And, the opposite extreme, in which the null hypothesis is always retained similarly minimizes Type 1 error at the cost of maximizing Type 2 errors.  Any testing procedure in between necessarily has some positive chance of each type of error.  <br><br>

As we will see, it is possible to construct hypothesis tests with an explicit cap (upper bound) on the Type 1 error rate $\alpha$.  This means that, whenever possible, it makes sense to design experiments and hypotheses such that Type 1 errors are more serious than Type 2 errors, so that they may be expressly controlled.  A hypothesis test that limits $\alpha$ to a prespecified level is called a "level-$\alpha$ test".  

## Tests based on a normal population

### Tests for a normal mean when the variance is known

Suppose a given population is known to follow a normal distribution with an unknown mean and a known variance $\sigma^2$.  We wish to test the point null hypothesis $H_0:\mu = \mu_0$ for some given number $\mu_0$ versus the alternative $H_a:\mu \ne \mu_0$.  And, we wish our test to limit the Type 1 error rate to a given level $\alpha$, say, $5\%$.  <br><br>

We obtain a random sample of size $n$ from the population.  How should we proceed?  If $H_0$ is true, then our data should look like it came from $N(\mu_0, \sigma^2)$; specifically, the sample mean should be "close" to $\mu_0$.  If $\overline X$ is close to $\mu_0$, then $H_0$ seems plausible, otherwise not.  Our intuition says our test should look like: "reject $H_0$ if $|\overline X-\mu_0|>c$" for some cutoff $c>0$.  The constraint on Type 1 error rate to be no more than $\alpha$ is enough to determine $c$:
\begin{align*}
1-\alpha &= P(-c\leq \overline X - \mu_0 \leq c)
& = P(-c/\sqrt{\sigma^2/n} \leq Z \leq c/\sqrt{\sigma^2/n})
\end{align*}
This implies we should reject $H_0$ if $|Z|>z_{1-\alpha/2}$ where
\[Z = \frac{\overline X - \mu_0}{\sqrt{\sigma^2/n}}\]
is the standardized sample mean assuming $H_0$ is true (often it is said, "under $H_0$").  























