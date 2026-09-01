# Grushko--Neumann rank additivity for free products

This repository gives a focused formalization of the binary
Grushko--Neumann theorem. For finitely generated groups `G` and `H`, the
minimal number of generators of their free product is additive:

```lean
theorem rank_freeProduct_eq_add
    {G H : Type u} [Group G] [Group H]
    [Group.FG G] [Group.FG H] :
    Group.rank (G ∗ H) = Group.rank G + Group.rank H
```

The theorem is stated against Mathlib's `Group.rank`, so the result is about
the actual minimal generator invariant rather than a chosen generating tuple.
The unqualified global declaration above is the exact theorem selected by
`comparator.json` in both `Challenge.lean` and `Solution.lean`. The checked
implementation library exposes the same proof as
`GrushkoNeumann.rank_freeProduct_eq_add`; the global declaration in
`Solution.lean` proves the selected surface by invoking that namespaced
implementation theorem. The public `Challenge.lean` is deliberately tiny and
Mathlib-only.

## Repository provenance

This repository is a focused, self-contained Palomar wrapper around the
substantive formalization in
[`MarshallHallTheorem`](https://github.com/Arthur742Ramos/MarshallHallTheorem/tree/449124d5b5659f0c34b5fbb46ffb671eeac4e08e).
The substantive `MarshallHall.lean` and `MarshallHall/` implementation files
are the pinned snapshot at commit
`449124d5b5659f0c34b5fbb46ffb671eeac4e08e`; this repository adds the focused
global Challenge/Solution surface, package wiring, and submission metadata.
It does not claim an independent reimplementation of those substantive
modules. The responsible maintainer controls both repositories.

## Proof architecture

The arbitrary-factor lower bound is proved through a finite labelled-graph
reduction. Starting with a finite subdivided rose for a generating tuple, the
development establishes the graph's marking, connectivity, reverse-freeness,
and Euler bound. A minimal null path contains a null monochromatic run. The
implemented reduction then always performs the same three stages: a source
unfold, a subsequent safe fold, and an explicit monochromatic-vertex
contraction. The contraction preserves the marking and, together with the
preceding stages, gives the strict decrease in the finite vertex set.

Strong induction on the number of vertices produces separated generators.
The factorwise rank bounds then give the lower bound, while the canonical
factor injections give the upper bound. Together they yield rank additivity.

The implementation is split so that the difficult steps are auditable:

- `MarshallHall/GrushkoGeneral.lean` contains the factorwise rank bookkeeping
  and the bridge from separated generators to rank equality.
- `MarshallHall/GrushkoReduction.lean` and
  `MarshallHall/GrushkoReductionChain.lean` contain the normal-form and
  induction interfaces.
- `MarshallHall/GrushkoRose.lean` constructs the initial finite labelled rose.
- `MarshallHall/GrushkoGraph.lean` proves the path-reading and Nielsen-move
  semantics.
- `MarshallHall/GrushkoFold.lean`, `GrushkoFoldStep.lean`, and
  `GrushkoInvariant.lean` verify safe folds and invariant preservation.
- `MarshallHall/GrushkoUnfold.lean`, `GrushkoRemove.lean`, and
  `GrushkoUnsafe.lean` verify the source-unfold, subsequent safe fold, and
  marking-preserving monochromatic-vertex contraction.
- `MarshallHall/GrushkoFull.lean` closes the strong induction and proves the
  arbitrary-factor theorem.

## Supporting corollaries

The same library includes the binary free-group calculation

```lean
theorem MarshallHall.rank_binaryFreeProduct
    {α β : Type*} [Fintype α] [Fintype β] :
    Group.rank (FreeGroup α ∗ FreeGroup β) =
      Fintype.card α + Fintype.card β
```

and its finite-indexed free-group analogue
`MarshallHall.GeneralGrushko.rank_coprodI_freeGroup`. The repository also
retains finite-core, free-factor, and LERF infrastructure from the surrounding
formalization program. Those modules are supporting code only: the Palomar
Challenge and Comparator select the Grushko--Neumann rank equality, not a
second Hall or subgroup-separability claim.

## References

- B. H. Neumann, [On the Number of Generators of a Free Product](https://doi.org/10.1112/jlms/s1-18.1.12), *Journal of the London Mathematical Society* 18(1) (1943), 12--20.
- J. R. Stallings, [Topology of finite graphs](https://doi.org/10.1007/BF02095993), *Inventiones Mathematicae* 71(3) (1983), 551--565.

## Verification

The project is pinned to Lean 4.32.0 and Mathlib v4.32.0.

```text
lake build
lake env lean --src-deps Challenge.lean
ruby scripts/validate-formalization.rb
./scripts/verify-comparator.sh
```

`Challenge.lean` contains one deliberate proof hole by design. The
implementation library, the public `GrushkoNeumann.lean` theorem, and
`Solution.lean` contain no proof holes or custom axioms; the permitted axioms
are the standard Mathlib foundation (`propext`, `Quot.sound`, and
`Classical.choice`).

The submission form is [Palomar](https://submit.palomar-registry.org/).
