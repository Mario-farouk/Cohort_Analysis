# Cohorts: A Useful Analysis Framework
Before we get into the code, I will define what cohorts are, consider the types of ques‐
tions we can answer with this type of analysis, and describe the components of any
cohort analysis.
A cohort is a group of individuals who share some characteristic of interest, described
below, at the time we start observing them. Cohort members are often people but can
be any type of entity we want to study: companies, products, or physical world phe‐
nomena. Individuals in a cohort may be aware of their membership, just as children
in a first-grade class are aware they are part of a peer group of first graders, or partici‐
pants in a drug trial are aware they are part of a group receiving a treatment. At other
times, entities are grouped into cohorts virtually, as when a software company groups
all customers acquired in a certain year to study how long they remain customers. It’s
always important to consider the ethical implications of cohorting entities without
their awareness, if any different treatment is to be applied to them.
Cohort analysis is a useful way to compare groups of entities over time. Many impor‐
tant behaviors take weeks, months, or years to occur or evolve, and cohort analysis is
a way to understand these changes. Cohort analysis provides a framework for detect‐
ing correlations between cohort characteristics and these long-term trends, which can
lead to hypotheses about the causal drivers. For example, customers acquired through
a marketing campaign may have different long-term purchase patterns than those
who were persuaded by a friend to try a company’s products. Cohort analysis can be
used to monitor new cohorts of users or customers and assess how they compare to
previous cohorts. Such monitoring can provide an early alert signal that something
has gone wrong (or right) for new customers. Cohort analysis is also used to mine
historical data. A/B tests, discussed in Chapter 7, are the gold standard for determin‐
ing causality, but we can’t go back in time and run every test for every question about
the past in which we are interested. We should of course be cautious about attaching
causal meaning to cohort analysis and instead use cohort analysis as a way to under‐
stand customers and generate hypotheses that can be tested rigorously in the future.
Cohort analyses have three components: the cohort grouping, a time series of data
over which the cohort is observed, and an aggregate metric that measures an action
done by cohort members.
Cohort grouping is often based on a start date: the customer’s first purchase or sub‐
scription date, the date a student started school, and so on. However, cohorts can also
be formed around other characteristics that are either innate or changing over time.
Innate qualities include birth year and country of origin, or the year a company was
founded. Characteristics that can change over time include city of residence and mar‐
ital status. When these are used, we need to be careful to cohort only on the value on
the starting date, or else entities can jump between cohort groups

# Cohort or Segment?
These two terms are often used in similar ways, or even inter‐
changeably, but it’s worth drawing a distinction between them for
the sake of clarity. A cohort is a group of users (or other entities)
who have a common starting date and are followed over time. A
segment is a grouping of users who share a common characteristic
or set of characteristics at a point in time, regardless of their start‐
ing date. Similar to cohorts, segments can be based on innate fac‐
tors such as age or on behavioral characteristics. A segment of
users that signs up in the same month can be put into a cohort and
followed over time. Or different groupings of users can be explored
with cohort analysis so that you can see which ones have the most
valuable characteristics. The analyses we’ll cover in this chapter,
such as retention, can help put concrete data behind marketing
segments.

# Retention
Retention is concerned with whether the cohort member has a record in the time
series on a particular date, expressed as a number of periods from the starting
date. This is useful in any kind of organization in which repeated actions are
expected, from playing an online game to using a product or renewing a sub‐
scription, and it helps to answer questions about how sticky or engaging a prod‐
uct is and how many entities can be expected to appear on future dates.
# Survivorship
Survivorship is concerned with how many entities remained in the data set for a
certain length of time or longer, regardless of the number or frequency of actions
up to that time. Survivorship is useful for answering questions about the propor‐
tion of the population that can be expected to remain—either in a positive sense
by not churning or passing away, or in a negative sense by not graduating or ful‐
filling some requirement.
# Returnship
Returnship or repeat purchase behavior is concerned with whether an action has
happened more than some minimum threshold of times—often simply more
than once—during a fixed window of time. This type of analysis is useful in sit‐
uations in which the behavior is intermittent and unpredictable, such as in retail,
where it characterizes the share of repeat purchasers in each cohort within a fixed
time window.
# Cumulative
Cumulative calculations are concerned with the total number or amounts meas‐
ured at one or more fixed time windows, regardless of when they happened dur‐
ing that window. Cumulative calculations are often used in calculations of 
customer lifetime value (LTV or CLTV).
