= Exercise 3.2.4
Let $cal(T)_c$ be the set of constant terms:

$
cal(T)_c = {"true", "false", 0}
$

From recurse definition of $S_i$:

$
S_3 = cal(T)_c union {"succ" t_1, "pred" t_1, "iszero" t_1 | t_1 in S_2} union {"if" t_1 "then" t_2 "else" t_3 | t_1, t_2, t_3 in S_2}
$ 

$
S_2 = cal(T)_c union {"succ" t_1, "pred" t_1, "iszero" t_1 | t_1 in S_1} union {"if" t_1 "then" t_2 "else" t_3 | t_1, t_2, t_3 in S_1}
$ 

$
S_1 = cal(T)_c union {"succ" t_1, "pred" t_1, "iszero" t_1 | t_1 in S_0} union {"if" t_1 "then" t_2 "else" t_3 | t_1, t_2, t_3 in S_0}
  = cal(T)_c union emptyset union emptyset
  = cal(T)_c
$ 

Binding to variables in the definition of $S_2$ creates a total of 9 elements for the first set after $cal(T)_c$
(namely, three `succ`s, three `pred`s and three `iszero`s) and 27 elements for the second set ($3 * 3 * 3$). This tells us that
the first set creates $3n$ elements and the second produces $n^3$, where $n$ is the number of elements in previous set. On top of those,
we add 3 constant elements from $cal(T)_c$, and are left with 39 elements in $S_2$.

The length of any set $S_n$ can be defined as:
$
|S_n| = 3 + 3|S_(n-1)| + |S_(n-1)|^3
$
so we can evaluate: 
$
|S_3| = 3 + 3*39 + 39^3 = 59439
$

= Exercise 3.2.5
Proof by induction proof for set cumulativity.

== Base case

$S_0 subset.eq S_1$ holds true, as $emptyset subset.eq {"true", "false", 0}$.

== Inductive hypothesis

Assume $S_k subset.eq S_(k+1)$ for some $k >= 0$.

== Inductive step

There are three cases of how a particular term $t$ ended up in $S_(k)$ to consider.
+ If $t in {"true", "false", 0}$, it was constructed from the first subset we used to build $S_k$.
  By definition of $S_k$ for $k >= 1$, these constants will always be a part of $S_k$, so $t in S_(k+1)$.
+ Let $t in {"succ" t^', "pred" t^', "iszero" t^'}$. If $t^' in S_(k-1)$, it follows from our hypothesis that $t^' in S_k$.
  When defining $S_(k+1)$, we will use $t^'$ again to include ${"succ" t^', "pred" t^', "iszero" t^'}$ in that new set. Therefore, $t in S_(k+1)$.
+ This case follows the same logic as the previous one. $t = "if" t_1 "then" t_2 "else" t_3$, where $t_1, t_2, t_3 in S_(k-1)$ and $t in S_k$.
  From hypothesis, $t_1, t_2, t_3 in S_k$. Thus, these terms will be used when defining $S_(k+1)$, meaning $t in S_(k+1)$.

We have proved $t in S_k -> t in S_(k+1)$. Therefore, $S_k subset.eq S_(k+1)$.

= Proof for theorem 3.3.4
To do.

= Exercise 3.5.5
To do.

= Exercise 3.5.10
To do.

= Exercises 3.5.13

== 1.

Given $"if true then" t_2 "else" t_3 -> t_3$,

1. Theorem 3.5.4 becomes invalid, as *E-Funny1* and *E-IfTrue* have the same form, but different evaluations. We can express this as:
$
  "if true then" t_2 "else" t_3 -> t_2 and "if true then" t_2 "else" t_3 -> t_3
$
$
  t_2 eq.not t_3
$

2. Theorem 3.5.7 remains valid. $t_3$ cannot be evaluated any further, so it is in normal form.

3. Theorem 3.5.8 remains valid and it's proof still applies, even though the definition of *E-Funny1* "collides" with *E-IfTrue*.

4. Theorem 3.5.11 becomes invalid, since theorem 3.5.4 is invalid -- $u eq.not u^'$.

5. Theorem 3.5.12 remains valid. If $"size"(t_3) > 1$, $t_3$ is to be evaluated again, that is $t_3 attach(->, tr:*) t_3^'$. Otherwise, $t_3$ is a value, and since theorem 3.5.7 is valid, it is in normal form. 

== 2. 
To do.
