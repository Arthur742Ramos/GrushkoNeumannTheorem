import MarshallHall

/-!
# Grushko--Neumann rank additivity for free products

This is the focused public library surface for the arbitrary-factor theorem.
The proof is implemented in the `MarshallHall` modules because that existing
development also contains the finite-core and Hall infrastructure; the new
namespace keeps the present submission mathematically focused.
-/

open Monoid.Coprod

universe u

namespace GrushkoNeumann

/-- The rank of a free product of two finitely generated groups is additive.

The implementation proceeds through a finite labelled-graph reduction.  A
minimal null path is handled by a source unfold, a subsequent safe fold, and
an explicit monochromatic-vertex contraction; strong induction on the finite
vertex set then gives the separated-generator lower bound.
-/
theorem rank_freeProduct_eq_add {G H : Type u} [Group G] [Group H]
    [Group.FG G] [Group.FG H] :
    Group.rank (G ∗ H) = Group.rank G + Group.rank H :=
  MarshallHall.rank_freeProduct_eq_add

end GrushkoNeumann
