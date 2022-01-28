# Conditional probabilities of events

Let $A$ and $B$ denote events in a sample space $\mathcal{S}$.  Suppose we know $B$ occurs.  Then, $P(A|B)$ denotes the **conditional probability** of $A$ given $B$.  This has the mathematical formula
\[P(A|B) = \frac{P(A\cap B)}{P(B)}.\]
In this formula, $B$ acts as the new or conditional sample space.  It is always true
\[P(A|\mathcal{S}) = \frac{P(A\cap \mathcal{S})}{P(\mathcal{S})} = \frac{P(A)}{1} = P(A).\]
Knowing $B$ happens is equivalent to changing the sample space to $B$.

### Example

Four individuals are donating blood to a blood bank.  Their blood types are unknown.  If exactly 1 of them is O+, then what is the probability at least 3 are typed in order to obtain an O+ sample?<br>
<br>
Answer: <br>
\[P(\text{at least three must be typed}) = P(3) + P(4).\]
\[P(3) = P(\text{first is not O+ and second is not O+ and third is O+}).\]
\[ = P(\text{first is not O+})P(\text{second is not O+ given first is not O+})P(\text{third is O+ given first two are not})\]
\[ = \frac{3}{4}\times \frac{2}{3}\times \frac{1}{2}.\]
We used a (perhaps intuitive) extension of the conditional probability formula above:
\[P(A\cap B\cap C) = P(C|A\cap B)P(A \cap B) = P(C|A\cap B)P(B|A)P(A)\]
Here, $A$, $B$, and $C$ represent the first, second, and third blood typings.  

### Example

Let $A$ be the event a randomly selected adult male US citizen is at least 6'3" tall.  Let $B$ be the event a randomly selected adult male US citizen is an NBA player.  Which is larger, $P(A|B)$ or $P(B|A)$?<br><br>

Answer:<br>
Be careful; these can be tricky.  $P(A)$ is much larger than $P(B)$ because there are many more male US citizens 6'3" or taller than there are NBA players (some also may not be US citizens).  And, $P(A|B)$ is much larger than $P(B|A)$.  The reason is that if we condition on US citizen NBA players, almost all of them are 6'3" or taller. However, if we condition on US males 6'3" or taller, NBA players are still a tiny proportion.   


### Example

Bertrand's Boxes --- There are three boxes: the first has two gold coins, the second one gold and one silver, and the third two silver coins.  You choose a box at random and a coin from the box at random.  Given you choose a gold coin, what is the probability the other coin in that box is gold?<br><br>

Answer:<br>

Let $G_1$ be the event the first coin chosen is gold and let $G_2$ be the event the second coin chosen (same box) is gold.  Let $B_1$, $B_2$, and $B_3$ denote events corresponding to choosing boxes 1, 2, and 3.  Then, we seek
\[P(G_2|G_1) = \frac{P(G_1\cap G_2)}{P(G_1)}.\]
\[P(G_1) = P(G_1 \cap B_1) + P(G_1 \cap B_2) + P(G_1 \cap B_3)\]
\[ = P(G_1 | B_1)P(B_1) + P(G_1 | B_2)P(B_2)+ P(G_1 | B_3)P(B_3)\]
\[ = 1 \times 1/3 + 1/2 \times 1/3 + 0 \times 1 /3 = 1/2.\]
\[P(G_1\cap G_2) = P(\text{chose box 1}) = P(B_1) = 1/3.\]
Therefore, 
\[P(G_2|G_1) = \frac{1/3}{1/2} = 2/3.\]

Note: This question, which is often called "Bertrand's Paradox", has caused an awful lot of consternation and controversy.  When pondering this question for the first time, many people will (incorrectly) suppose the answer is 1/2.  Their logic is that since the first coin was gold, then either the first or second box was chosen.  Then, those boxes being equally likely, there is a 1/2 chance box 1 was chosen, and, therefore, the chance of the second coin being gold is 1/2.  The first part of that logic is well-founded: the third box could not have been chosen.  However, the fact the first coin is gold also implies we were more likely to have chosen the first box than the second---those two boxes are not equally likely in light of the information that the first coin was gold.  Indeed, we could have simply asked "what is the chance we selected box 1 given the coin is gold?"---that question is equivalent to asking the chance the second coin is gold.  When rephrased this way, most people find it easier to see that the chosen box is more likely box 1 than box 2 (twice as likely, in particular), given the first coin selected is gold.  

## Bayes' rule

In the example of Bertrand's Paradox you might have noticed we used a slick trick to compute $P(G_1)$---we **partitioned** the event $G_1$ into three pieces $G_1 = \{G_1 \cap B_1\}\cup \{G_1 \cap B_2\}\cup \{G_1 \cap B_3\}$ where $\{B_1 \cup B_2 \cup B_3\} = \mathcal{S}$.  Partitioning is the act of subdividing a set into non-overlapping, or **disjoint**, subsets.  This way, we can represent a set as a union of subsets, much like a pizza is equivalent to the collection of pizza slices.  This partitioning trick is useful enough to be given a name, *the Law of Total Probability*: If $A_1, \ldots, A_n$ is a collection of disjoint subsets of $\mathcal{S}$ such that $\mathcal{S} = \bigcup_{i=1}^n A_i$ (i.e., the collection is exhaustive), then for any $B\subset \mathcal{S}$
\[P(B) = \sum_{i=1}^n P(B \cap A_i) = \sum_{i=1}^n P(B | A_i)P(A_i).\]
Recall the axiom of countable additivity; it's basically equivalent to the law of total probability.   


<br><br>

Often times information is known about certain conditional probabilities---$P(A|B)$---but we want to know the reverse conditional probability $P(B|A)$.  Bayes' rule provides a formula for computing these reverse conditional probabilities.  There's not really anything special about the formula; after all, it follows immediately from the definition of conditional probability:
\[P(A|B) = \frac{P(A\cap B)}{P(B)} = \frac{P(A\cap B)P(A)}{P(B)P(A)} = \frac{P(B|A)P(A)}{P(B)}.\]
Or, in other words,
\[P(A|B)P(B) = P(B|A)P(A).\]

### Example

Perhaps the most famous example of Bayes' rule illustrates the difficulty in detecting rare events.  Suppose 1 in 1000 adults suffers from a (fairly rare) disease.  A diagnostic test is 99% effective in detecting disease among individuals who have the disease.  Among people who do not have the disease, the diagnostic test is nevertheless positive 2% of the time.  Given the test is positive, what is the chance the individual tested has the disease?<br><br>

Answer:<br>
Let $A$ be the event the test is positive and let $B$ be the event the individual tested has the disease.  Then, we are given $P(B) = 0.001$.  By the law of total probablity
\[P(A) = P(A\cap B)+P(A\cap B^c) = P(A| B)P(B)+P(A| B^c)P(B^c) = 0.99\times 0.001 + 0.02\times 0.999 = 0.02097\]
We want to find $P(B|A)$, which is equal to $P(A|B)P(B)/P(A)$ by Bayes' rule.  So,
\[P(B|A) = P(A|B)P(B)/P(A) = 0.99\times 0.001 / 0.02097 = 0.0472103.\]
This is a terrible diagnostic test.  Less than 5% of people who test positive actually have the disease.

## Independence

Two events $A$ and $B$ are independent if
\[P(A|B) = P(A).\]
In other words, knowing $B$ happens does not affect the chance of $A$ happening.  By using the definition of conditional probablity, it follows that
\[P(A|B) = \frac{P(A\cap B)}{P(B)} \stackrel{ind.}{=}P(A)\Rightarrow P(A\cap B) = P(A)P(B).\]
Further, if $P(A\cap B) = P(A)P(B)$ then, again using the definition of conditional probability
\[P(A|B) = \frac{P(A\cap B)}{P(B)} = \frac{P(A)P(B)}{P(B)} = P(A).\]
Therefore, independence of two events $A$ and $B$ is equivalent to the *product rule* being satisfied:
\[A\text{ and }B\text{ independent } \iff P(A\cap B) = P(A)P(B).\]

Independence extends to collections of events.  For example, intuitively we know two rolls of a die are independent.  But, ther'e nothing special about rolling a die twice; three or more rolls are also, intuitively, mutually independent.  To be precise, we say a collection of events $A_1, A_2, \ldots$ is *pairwise independent* if for every pair $A_i, A_j$, $i\ne j$ the product rule holds: $P(A_i \cap A_j) = P(A_i)P(A_j)$.  Furthermore, a collection of events $A_1, A_2, \ldots$ with index set equal to the natural numbers $\mathbb{N}$ (or a finite subset) is *mutually independent* if every subset $\{A_i, i\in I, I\subset \mathbb{N}\}$ of events obeys the product rule: $P( \bigcap_{i \in I} A_i) = \prod_{i \in I} P(A_i)$.  <br><br>

Example: Consider rolling a fair die $n$ times and recording the outcomes.  Let $A_i,$ $i = 1,\ldots,n$ be the event the $i^{th}$ roll is odd.  The set $\{A_i, i=1, \ldots, n\}$ is mutually independent.  <br><br>

Example: Let $A$ and $B$ denote the events that the first and second tosses of a fair coin are heads.  These are independent events.  Define $C = \{\{A\cup B\}-\{A\cap B\}\}$. Then, $A$ and $C$ are pairwise independent.  To see this, compute:
\[P(A \cap C) = P(A \cap \{\{A \cap B^c\} \cup \{A^c \cap  B\}\}) = P(A \cap \{A \cap B^c\}) + P(A \cap \{A^c \cap  B\}) = P(A \cap B^c) = P(A)(1-P(B)) = 0.25\]
\[P(C) = P(A \cap B^c) + P(A^c \cap B) = P(A) - P(A)P(B) + P(B)- P(A)P(B) = 0.5\]
\[P(A)P(C) = 0.25\]
But, A, B, and C are not mutually independent because
\[\{A\cap B\cap C\} = \{\{A\cap B\}\cap \{A \cap B^c\}\} \cup \{\{A\cap B\}\cap \{A^c \cap B\}\} = \emptyset\]
So, $P(A\cap B\cap C) = 0$, while $P(A)P(B)P(C) = 0.125$.



## Exercises

1. Seventy percent of small, private-use aircraft that disappear in flight are eventually discovered.  Of the aircraft that are discovered, $60\%$ have a black box, whereas $90\%$ of the missing aircraft that are not discovered do not have a black box.  Suppose an aircraft has disappeared.<br>
a. If it has a black box what is the probability it will not be discovered?<br>
b. If it does not have a black box what is the probability it will be discovered?

<br><br>

2.  Consider rolling two different fair, six-sided dice, one red and one green.  Let $A$ be the event the red die is 3, $B$ be the event the green die is $4$, and $C$ be the event the sum of the two die is $7$.<br>
a. Are $A$ and $B$ independent?<br>
b. Are $B$ and $C$ independent?<br>
c. Are $A$ and $C$ independent?<br>
d. Are the three events mutually independent?





