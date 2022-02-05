# Expectation of Random Variables

## Mean of a Random Variable

Let $X$ be a random variable.  Then the *expectation* of $X$ is denoted $E(X)$.  For discrete $X$,
\[E(X) = \sum_{x} x p(x)\]
*if it exists...* It is possible the sum above diverges, i.e. equals infinity, in which case we say $E(X)$ does not exist.  For a continuous random variable on $(a,b)$, 
$E(X) = \int_a^b x f(x)dx$.  Again, it is possible this integral does not exists, in which case neither does the expectation exists.<br><br>

Typical notation for $E(X)$ is $\mu'$  "mu prime" and the expectation $E(X)$ is also called the "first raw moment".  This notation primarily comes from physics.  In statistics, $E(X)$ is often denoted $\mu$, with out the prime/apostrophe.<br><br>

$E(X)$ can be understood as the probability-weighted mean of $X$.  This is easiest to see if $X$ is discrete and takes values in a finite set, say $\{x_1, x_2, \ldots, x_p\}$.  Then, the average of these values is $(1/p)(x_1 | x_2 + \cdots + x_p)$.  If $X$ takes each of these values with probablity $1/p$ (equally-likely) then this arithmetic average can be interpreted as the long-run average observed value of $X$ if we were to repeat the experiment many times or as our best guess of the next outcome of the experiment, on average.  If the outcomes are not equally-likely, rather they have probabilities $p(x)$, then the probability-weighted average, rather than the arithmetic average, describes the long-run average outcomes of the experiment.  

### Examples

1. Let $X$ be the numer of heads in 20 flips of a fair die.  Recall $p(x) = {20 \choose x}\left(\frac12\right)^20$.  Then, 
\begin{align*}
\mu' = E(X) &= \sum_{x = 0}^{20} x {20 \choose x}\left(\frac12\right)^{20}\\
&=  \sum_{x = 0}^{20} \frac{x20!}{x!(20-x)!}\left(\frac12\right)^{20}\\
&=  \sum_{x = 1}^{20} \frac{20!}{(x-1)!(20-x)!}\left(\frac12\right)^{20}\\
&=  \sum_{x = 1}^{20} \frac12 20\frac{19!}{(x-1)!(19-(x-1))!}\left(\frac12\right)^{19}\\
& = \frac12 20 \sum_{x = 0}^{19} \frac{19!}{x!(19-x)!}\left(\frac12\right)^{19}\\
& = \frac12 20\\
& = 10.
\end{align*}
Notice the "average value" of $X$ is 10 heads in 20 flips.  That matches our intuition: if the coin is fair and we flip it 20 times, then our best guess for the number of heads we would get is 10.

<br><br>
2.  Let $X$ be a random variable taking positive real values $(0,\infty)$.  Check that $f(x) = \frac{1}{(1+x)^2}$ is a valid PDF of $X$ and show $E(X)$ does not exist for this PDF. <br><br>
Solution:<br>
First, note $1/(1+x)^2 > 0$ for all $x>0$.  Next, see that
\[\int_0^\infty f(x)dx = -\frac{1}{1+x}|_0^\infty = \left(-\lim_{t\rightarrow \infty}\frac{1}{1+t}\right) + \frac{1}{1} = 1-0 = 1.\]
Second, 
\begin{align*}
\mu' = E(X) &= \int_{0}^\infty x\frac{1}{(1+x)^2}dx\\
&= \int_1^\infty \frac{u-1}{u^2}du\\
&= \left(\lim_{t\rightarrow \infty} \ln u - \frac{1}{u}\right) + 1 \\
&= \infty
\end{align*}
Conclude $E(X)$ does not exist.

## Variance of a random variable

If the expectation of a random variable describes its average value, then the variance of a random variable describes the magnitude of its range of likely values---i.e., it's variability or spread.  The variance of a r.v. $X$ is defined as
\[V(X) = E(X^2) - E(X)^2\]
or, equivalently, as
\[V(X) = E[\{X - E(X)\}^2].\]
Another name for the variance is the "second central moment" or "second moment about the mean" and it may be denoted $\mu_2$.  This notation is more prevalent in physics than in statistics.  In statistics, $\sigma^2$ is often used to denote the variance---that is "sigma squared" where $\sigma$ is the (lower case) Greek letter sigma.  <br><br>

Like the mean, it is possible for the variance not to exist.  The variance exists so long as $E(X^2)$ exists (is finite).  

### Examples

1.  The outcome of a roll of a fair six-sided die can be described as a random variable $X$ taking values im $\{1,2,3,4,5,6\}$ with equal probability.  The mean of $X$ is
\[\mu' = E(X) = \frac{1}{6}(1+2+3+4+5+6) = \frac{1}{6}\left(\frac{6\times 7}{2}\right) = 3.5.\]
The secomd raw moment, $\mu_2'$ or $E(X^2)$ is
\[\mu_2' = \sum_{x=1}^6 x^2\frac{1}{6} = \frac{1}{6}(1+4+9+16+25+36) = \frac{1}{6}\left(6\times 7\times 13 / 6\right) = 91/6\]
Then, the variance is equal to
\[\mu_2 = V(X) = E(X^2) - E(X)^2 = 91-3.5^2 = 35/12\]
The variance of a roll of the die is about 3---this makes sense as a measure of spread/variability of a die roll.

<br><br>

2.  Take the previous example of measuring the location of an auto accident along 200 miles of interstate I-80 in Iowa.  Suppose the PDF is the uniform probability assignment $f(x) = 1/200$ where the location $X$ is measured in miles.  The mean of $X$ is
\[\mu' = E(X) = \int_0^{200} x \frac{1}{200}dx = \frac{x^2}{400}|_0^{200} = 100\]
which is the midpoint.  That seems intuitive.  The second raw moment of $X$ is
\[\mu_2' = E(X^2) = \int_0^{200} x^2 \frac{1}{200}dx = \frac{x^3}{600}|_0^{200} = 13,333.33.\]
Then, the variance of $X$ is
\[\mu_2 = V(X) = E(X^2) - E(X)^2 =  13,333.33 - 100^2 = 3,333.33\]
<br><br>

The variance is measured in the squared units of $X$.  For example, in the previous example, the variance represents 3,333.33 miles squared.  The *standard deviation* is the square root of the variance, and is often represented by $\sigma$ in statistics.  The standard deviation of the location of the auto accident is 57.735 miles---and note the units of standard deviaiton are the same as the units of $X$.  For this reason, standard deviation can be easier to use to describe variability of a random variable.


## Special uses of mean and variance

Besides describing the average value and spread of a random variable, its mean $E(X)$ and variance $V(X)$ have special relationships to its probabilities, in particular, its CMF/CDF.  <br><br>

Suppose $X$ is a  non-negative, continuous r.v. and consider computing its mean.  The following mathematical statement says its mean is no smaller than $a(1-F(a))$ for every $a >0$:
\[E(X) = \int_0^\infty xf(x)dx = \int_0^a xf(x)dx+\int_a^\infty xf(x)dx\geq \int_a^\infty xf(x)dx \geq \int_a^\infty af(x)dx = a(1-F(a)).\]
Put another way, 
\[P(X \geq a) \leq \frac{E(X)}{a}.\]
This result is called *Markov's Inequality* and it has important implications for probabilities of "extreme values"---if a r.v. has a finite expectation, then the chance it takes a very large values ($\geq a$) is small, i.e., no more than $E(X)/a$.  <br><br>

There is a refined version of Markov's inequality called *Chebyshev's Inequality* that applies to all r.v.'s with a mean and variance, not only non-negative r.v.'s; it says:
\[P(|X - E(X)| \geq a) \leq \frac{V(X)}{a^2}.\]
In other words, the chance of an extreme value (greater than $a$ units from $X$'s mean) is bounded by $V(X)/a^2$.

<br><br>


### Examples

1. Use Markov's Inequality to bound the chance of 19 or more heads in 20 flips of a fair coin.<br><br>

\[P(X \geq 19) \leq \frac{10}{19}.\]

Note the true probability is much smaller, about 0.00002<br><br>

2. Use Chebyshev's Inequality to bound the chance there are either 0 or 20 heads.  

\[P(|X - 10|\geq 10)\leq \frac{V(X)}{10}.\]

We need to know the second raw moment, $E(X^2)$.  This is tricky, but can be obtained by a similar argument as we used to derive $E(X)$.  Verify that $E(X^2) = 20\times 1/2 \times  1/2 + (20\times 1/2)^2$ so that $v(X) = E(X^2) - E(X)^2 = 20\times 1/2 \times 1/2 = 5$.  The bound using Chebyshev's inequality is 1/2.  Note the true probability is $2\times 0.5^{20}$, much smaller.  


## Expectations of functions of random variables

Let $X$ denote a continuous random variable with PDF $f(x)$, and let $Y = g(X)$ for some function $g$.    








