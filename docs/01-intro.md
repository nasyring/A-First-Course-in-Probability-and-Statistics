# Data Analysis and Statistical Inference

In this first chapter we define and discuss some important concepts regarding data and scientific investigation.

## Data, Experiments, and Studies

There are, roughly, two ways we encounter data: in designed, interventional experiments and in observational studies.  In the former a scientist (researcher/investigator) first poses a question and then designs an experiment with the intention of answering their question.  They perform the experiment, observing the outcome (perhaps more than one time), and these observations are referred to as their experimental data.  In experiments the experimenter is an active participant, affecting the individuals observed in order to obtain a specific outcome.  Observational studies, in contrast, lack any kind of intervention; the researcher simply records and interprets observations.  Regardless of the source, experiment or observational study, data is anything observed by the researcher that is relevant for answerig their research questions
 

### James Lind's Scurvy Trial

Clinical trials are familiar designed, interventional experiments.  A famous, early example is James Lind's Scurvy trial.  Lind was a doctor aboard a British ship.  Several sailors with him were suffering from scurvy.  He selected 12 sailors in similar, poor condition, and assigned to pairs of them 6 different treatments (the intervention).  The two who received oranges and lemons to eat recovered fully; those who received apple cider fared next best.

### Framingham Heart Study

Named for Framingham, Massachusetts, where the participants were first recruited, is a long-running observational study of Americans aimed at understanding risks associated with heart disease.  Participants agreed to medical testing every 3-5 years, from which the study researchers concluded a number of important findings, such as cigarett smoking substantially increases the risk of heart disease.  There are no interventions; the researchers simply observe the patients and make conclusions based on how the patients choose to live, e.g., tobacco use.  

## Randomization, control, and causation

Several characteristics of experiments and observational studies contribute to how their corresponding data should be analyzed.  In experiments the researcher performs one or more interventions---such as giving patients cider versus citrus fruits in Lind's scurvy trial.  The principle of {\em randomization} asserts that interventions in experiments should be assigned to subjects randomly.  These subjects are often referred to as experimental units.  When experimental units are heterogeneous---not all the same---it stands to reason that some of their differencees apart from the intervention may impact the response to the experiment recorded by the researcher.  Randomization is a way to even out these heterogeneities between groups receiving different interventions.  That way, it is the intervention, rather than some other difference, which is responsible for substantially different outcomes.  Randomization systematically accounts for heterogeneities, but the extent to which it works depends on the number of experimental units, the number of groups being randomized, and the presence of one or more important heterogeneities.  For examples, consider the following:
1. Suppose in ten experimental units there is one unobserved, dichotomous trait that affects the experimental response.  Three of the ten have version "0" of the trait and 7 have version "1".  Randomly split the ten into two groups of five, each group to receive a different intervention.  The chance all three end up in the same group is 1/6, not ignorably small... 
2. On the other hand, suppose there are 100 experimental units, half have trait "0" and half trait "1".  The chance at least 35 of either trait type end up in the same one half random split is $\approx 0$.  
Generally when an intervention is randomized over experimental units we interpret any significant difference in outcome/response between intervenion groups as having been {\em caused} by the intervention itself, as opposed to some other unobserved characteristic---these are sometimes called {\em lurking variables} or {\em confounding variables}.  But, randomization is not foolproof; small sample sizes (few experimental units) and/or the presence of many confounding variables can reduce the effectiveness of randomization.



