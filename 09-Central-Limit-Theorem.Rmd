# Central Limit Theorem

Let $X_1, X_2, \ldots, X_n$ denote a random smple from a distribution with finite mean $\mu$ and variance $\sigma^2$.  Then, the standardized random variable 
\[Y_n := \frac{\sum_{i=1}^n X_i - n\mu}{\sqrt{n}\sigma}\]
**converges in distribution** to a standard normal random variable, which means
\[\lim_{n\rightarrow \infty}F_{Y_n}(z) \rightarrow F_Z(z)\]
where $F_{Y_n}$ and $F_Z$ denote the CDFs of $Y_n$ and the standard normal distribution, respectively.<br>

Note: IF $Y_n$ has a MGF, then it is equivalent to say
\[\lim_{n\rightarrow \infty}M_{Y_n}(t) \rightarrow M_Z(t),\]
i.e., that the MGFs converge, because the MGF and CDF are 1-1, being linked by the inverse Laplace transform.  <br><br>

We'll give the proof for the case $Y_n$ has an MGF, and this case applies to, e.g., the Binomial convergence to Normal (DeMoivre-Laplace Theorem).<br><br>

Proof:<br>
Let $X_i$ have MGF $M_X(t)$ and consifer the MGF of the de-meaned r.v. $(X - \mu)$---this is just $X$ minus its mean.  This r.v. has MGF $m(t):=E(e^{t(X-\mu)}) = E(e^{-\mu t}e^{tX}) = e^{-\mu t}M_X(t)$.  Since $m(t)$ is a MGF, it must be that 
\[m(0) = \int e^{-\mu \cdot 0}e^{0 x}f_X(x-\mu)dx = \int f_X(x-\mu)dx = 1,\]
\[\frac{d}{dt}m(t)|_{t=0} = E(X-\mu) = 0\]
\[\frac{d^2}{dt^2}m(t)|_{t=0} = E[(X-\mu)^2] = \sigma^2.\]
Recall Taylor's Theorem, which says there exists a number $\xi$ between $0$ and $t$ such that
\[m(t) = m(0) + t \frac{d}{dt}m(t)|_{t=0} + \frac{t^2}{2}\frac{d^2}{dt^2}m(t)|_{t=\xi}.\]
Simplifying the right hand side we have
\[m(t) = 1 + \frac{\sigma^2 t^2}{2} + \frac{1}{2}\left[\frac{d^2}{dt^2}m(t)|_{t=\xi} - \sigma^2\right]t^2.\]
Next, let $M_{Y_n}(t)$ denote the MGF of the standardized r.v. $Y_n$ and find it can be written in terms of $m(t)$ as follows:
\begin{align*}
M_{Y_n}(t) & = E\left[\exp\left(t\frac{\sum X_i - n\mu}{\sigma \sqrt{n}}\right)\right]\\
& \stackrel{ind.}{=}\prod_{i=1}^n E\left[\exp\left(t\frac{X_i - n\mu}{\sigma \sqrt{n}}\right)\right]\\
& \stackrel{iid.}{=}\left(m\frac{t}{\sigma/\sqrt{n}}\right)^n.
\end{align*}
Then, replacing $t$ by $t/\sigma\sqrt n$ in the Taylor expansion, we have
\[M_{Y_n}(t) = \left\{1 + \frac{t^2}{2n} + \frac{1}{2n\sigma^2}\left[\frac{d^2}{dt^2}m(t)|_{t=\xi} - \sigma^2\right]t^2\right\}^n.\]
Note $\frac{d^2}{dt^2}m(t)$ is continuous, $\frac{d^2}{dt^2}m(t)|_{t=0} = \sigma^2$, and $\xi \rightarrow 0$ as $n\rightarrow \infty$, which together implies 
\[\lim_{n\rightarrow \infty}\left[\frac{d^2}{dt^2}m(t)|_{t=\xi} - \sigma^2\right] = 0.\]
Therefore,
\begin{align*}
\lim_{n\rightarrow \infty} M_{Y_n}(t) & = \lim_{n\rightarrow \infty}\left\{1 + \frac{t^2}{2n} + \frac{1}{2n\sigma^2}\left[\frac{d^2}{dt^2}m(t)|_{t=\xi} - \sigma^2\right]t^2\right\}^n \\
& = e^{t^2/2}
\end{align*}
which is the MGF of the standard normal distribution.



