# Repository provenance

This repository is a focused Palomar submission wrapper, not an independent
copy of the substantive Grushko proof. Its substantive formalization is
[`Arthur742Ramos/MarshallHallTheorem`](https://github.com/Arthur742Ramos/MarshallHallTheorem/tree/449124d5b5659f0c34b5fbb46ffb671eeac4e08e)
at the immutable commit
`449124d5b5659f0c34b5fbb46ffb671eeac4e08e`.

The `MarshallHall.lean` entry point and the `MarshallHall/` implementation
modules in this repository are the self-contained snapshot of that pinned
revision. The focused repository adds the global `Challenge.lean` and
`Solution.lean` declarations, the `GrushkoNeumann` namespace surface, package
wiring, and submission metadata. The Comparator-selected declaration is the
unqualified global `rank_freeProduct_eq_add`; its proof delegates to
`GrushkoNeumann.rank_freeProduct_eq_add`, which delegates to the substantive
`MarshallHall` theorem.

The responsible maintainer controls both repositories and authorizes the use
of the pinned substantive snapshot for this submission. The source
repository, revision, and wrapper role are also recorded in
`formalization.yaml`.
