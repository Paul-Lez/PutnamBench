Require Import Reals List Rtrigo_def Coquelicot.Derive.
Open Scope R.
Definition putnam_2023_a1_solution : nat := 18.
Theorem putnam_2023_a1
    (f : nat -> R -> R := fun n (x : R) => 
        let f_i i := cos (INR i * x) in 
            let coeffs := map f_i (seq 1 n) in 
                fold_right Rmult 1 coeffs
    )
    : gt putnam_2023_a1_solution 0 /\ Derive_n (f putnam_2023_a1_solution) 2 0 > 2023 /\ (forall n : nat, (gt n 0 /\ lt n putnam_2023_a1_solution) -> Derive_n (f n) 2 0 <= 2023).
Proof. Admitted. 

