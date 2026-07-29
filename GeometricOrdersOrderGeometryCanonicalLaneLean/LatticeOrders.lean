import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure LatticeStructure (A : AdmissibleClass) where
  carrier : Type u
  le : carrier → carrier → Prop
  partialOrder : PartialOrderStructure A
  sup : carrier → carrier → carrier
  inf : carrier → carrier → carrier
  supUpper : ∀ x y : carrier, le x (sup x y) ∧ le y (sup x y)
  infLower : ∀ x y : carrier, le (inf x y) x ∧ le (inf x y) y
  supLeast : ∀ x y z : carrier, (le x z ∧ le y z) → le (sup x y) z
  infGreatest : ∀ x y z : carrier, (le z x ∧ le z y) → le z (inf x y)

structure LatticeEvidence {A : AdmissibleClass} (L : LatticeStructure A) where
  partialOrderClosed : PartialOrderClosed L.partialOrder
  supUpperClosed : L.supUpper
  infLowerClosed : L.infLower
  supLeastClosed : L.supLeast
  infGreatestClosed : L.infGreatest

def LatticeClosed {A : AdmissibleClass} (L : LatticeStructure A) : Prop :=
  PartialOrderClosed L.partialOrder ∧ L.supUpper ∧ L.infLower ∧ L.supLeast ∧ L.infGreatest

theorem lattice_closed_from_evidence {A : AdmissibleClass} (L : LatticeStructure A)
    (E : LatticeEvidence L) : LatticeClosed L := by
  exact And.intro E.partialOrderClosed (And.intro E.supUpperClosed (And.intro E.infLowerClosed (And.intro E.supLeastClosed E.infGreatestClosed)))

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse