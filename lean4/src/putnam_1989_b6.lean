import Mathlib

open Nat Filter Topology Set ProbabilityTheory

-- Note: uses (ℝ → ℝ) instead of (Set.Icc 0 1 → ℝ)
/--
Let $(x_1,x_2,\dots,x_n)$ be a point chosen at random from the $n$-dimensional region defined by $0<x_1<x_2<\dots<x_n<1$. Let $f$ be a continuous function on $[0,1]$ with $f(1)=0$. Set $x_0=0$ and $x_{n+1}=1$. Show that the expected value of the Riemann sum $\sum_{i=0}^n (x_{i+1}-x_i)f(x_{i+1})$ is $\int_0^1 f(t)P(t)\,dt$, where $P$ is a polynomial of degree $n$, independent of $f$, with $0 \leq P(t) \leq 1$ for $0 \leq t \leq 1$.
-/
theorem putnam_1989_b6
  (n : ℕ) (hn : 0 < n)
  (S : (ℝ → ℝ) → (Fin (n + 2) → Icc (0 : ℝ) 1) → ℝ)
  (hS : ∀ f x, S f x = if StrictMono x ∧ x 0 = 0 ∧ x (-1) = 1 then ∑ i in Icc 0 n, (x (i + 1) - x i) * f (x (i + 1)) else 0)
  : ∃ P : Polynomial ℝ,
    P.degree = n ∧
    (∀ t ∈ Icc 0 1, P.eval t ∈ Icc 0 1) ∧
    (∀ f : ℝ → ℝ,
      f 1 = 0 ∧ ContinuousOn f (Icc 0 1) →
      𝔼[fun x => S f x] = ∫ t in (0)..1, f t * P.eval t) :=
  sorry
