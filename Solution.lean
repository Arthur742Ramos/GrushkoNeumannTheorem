import GrushkoNeumann

/-!
# Checked Grushko--Neumann solution

The solution proves the global Comparator-selected declaration by invoking
the namespaced implementation theorem whose kernel-checked finite
labelled-graph reduction closes in `MarshallHall/GrushkoFull.lean`.
-/

open Monoid.Coprod

universe u

theorem rank_freeProduct_eq_add {G H : Type u} [Group G] [Group H]
    [Group.FG G] [Group.FG H] :
    Group.rank (G ∗ H) = Group.rank G + Group.rank H := by
  exact GrushkoNeumann.rank_freeProduct_eq_add
