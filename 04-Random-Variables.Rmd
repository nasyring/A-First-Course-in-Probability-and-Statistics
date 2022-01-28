# Random Variables

## Random variables

So far, we've discussed probabilities for events that are subsets of simple, finite sample spaces.  However, often we are interested in continuous measurements/responses on sampled individuals, so we need to expand our probability calculus to accomodate this more general situation.  <br><br>

Let $X$ denote a numerical response or function of a random sample from $\mathcal{S}$.  For a basic example, consider the experiment of flipping a fair coin and recording the outcome.  Then $\mathcal{S} = \{H, T\}$, but we might map heads and tails to the numbers 1 and 0.  Therefore, let $X:\{H,T\}\mapsto \{1,0\}$ with $X(H) = 1$ and $X(T) = 0$ denote this mapping/function. $X$ is a *random variable*---or mapping---defined on the space $\{0,1\}$, taking the sample space as domain and some space of numbers as its codomain.  <br><br>

In many cases we will consider *continuous random variables*, mappings with codomain equal to the real numbers, denoted $\mathbb{R}$, or some (uncountable) subset thereof, like the inteval $(0,1)$.<br><br>

In contrast, when the codomain of a random variable is a countable set of numbers, e.g., the positive integers, then we call it a *discrete random variable*.<br><br>

### Examples

1. Consider an experiment in ehich a mechanical dialer machine randomly dials phone numbers with a given area code.  This is a common practice in polling.  Let $Y$ denote the random variable with value $1$ if the dialed number is on a "do not call list" and zero otherwise.  A random variable (r.v.) that can only take values 0 or 1 is called a Bernoulli random variable.  (Oddly enough, a random variable that can only take values 1 or -1 is called a Rademacher r.v. !)<br><br>

2. A quality control test is used to test the strength of concrete beams.  The test exposes beams to both shear forces and flexure forces until each beam fails.  An experiment randomly selects three failed beams and observes whether each failed due to shear (S) or flexure (F) forces. The sample space is:
\[\mathcal{S} = \{SSS, SSF, SFS, FSS, SFF, FFS, FSF, FFF\}.\]
Let $X$ denote the random variable that counts the number of beams that fail due to flexure force.  It has codomain $\{0,1,2,3\}$ and is defined by the mapping
\[X(SSS) = 3, \, X(SSF) = 1, \, \ldots, X(FFF) = 0.\]

3. In the context of 2. above suppose an experiment randomly selects a failed beam and measures the force $X$ applied at point of failure in Newtons.  Consider the sample space of all hypothetical concrete beams that could be tested.  Then, $X$ is a continuous r.v. with codomain $(0,U)$ for some upper bound $U$.  Depending on what is known about the beams, we may take $U$ to be a specified upper bound, or we may set $U = \infty$.  More on this later...

## Probability Mass Functions

A *probability mass function* or PMF is a function that assigns probabilities to values of discrete r.v.'s.  We'll write $p(x)$ for the PMF of a r.v. $X$ where $x$ indicates any value in the codomain of $X$.  When $X$ is a finite r.v. with only a small number of possible values its PMF can be conveniently expressed as a table of values.  For example, in the concrete beam example in 2. above we have
\[x: 0 \quad 1\quad 2\quad 3\]
\[p(x):1/8\quad 3/8\quad 3/8 \quad 1/8\]

We can also represent PMFs using a function.  For example, the probability $x$ heads are observed in 20 flips of a fair coins is given by $p(x) = {20 \choose x}(\frac{1}{2})^{20}$.  <br><br>

Example:  Suppose a contractor needs between 1 and 5 (inclusive) permits for a construction job.  If $p(x)\propto x^2$ then find $p(x)$.  The key is that $\sum_{x=1}^5 p(x) = 1$. Therefore, we need to find the proportionality constant $C$ satisfying $C(1^2+2^2+3^2+4^2+5^2) = 1$. Verify $p(x) = x^2 / 55$.






