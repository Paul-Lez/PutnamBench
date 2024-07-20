Require Import Reals Ensembles Finite_sets Coquelicot.Coquelicot.
Theorem putnam_1971_a1
    (S : Ensemble (Z * Z * Z))
    (hS : cardinal _ S 9)
    (L : (Z * Z * Z) * (Z * Z * Z) -> Ensemble (R * R * R)
       := fun '((a,b,c), (d,e,f)) => fun (x : R * R * R) => (exists t : R, 0 < t < 1 /\ x = (t * (IZR a) + (1 - t) * (IZR d), t * (IZR b) + (1 - t) * (IZR e), t * (IZR c) + (1 - t) * (IZR f))))
    : exists x y z : Z, exists P Q : Z * Z * Z, In _ S P /\ In _ S Q /\ P <> Q /\ In _ (L (P,Q)) (IZR x, IZR y, IZR z).
Proof. Admitted.
