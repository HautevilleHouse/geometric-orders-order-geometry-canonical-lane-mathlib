import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure LatticePackage where
  carrierSet : Type u
  meet : carrierSet → carrierSet → carrierSet
  join : carrierSet → carrierSet → carrierSet
  meetAssoc : ∀ a b c : carrierSet, meet (meet a b) c = meet a (meet b c)
  joinAssoc : ∀ a b c : carrierSet, join (join a b) c = join a (join b c)
  meetComm : ∀ a b : carrierSet, meet a b = meet b a
  joinComm : ∀ a b : carrierSet, join a b = join b a
  absorption : ∀ a b : carrierSet, meet a (join a b) = a
  joinAbsorption : ∀ a b : carrierSet, join a (meet a b) = a

structure LatticeEvidence (L : LatticePackage) where
  meetAssocClosed : L.meetAssoc
  joinAssocClosed : L.joinAssoc
  meetCommClosed : L.meetComm
  joinCommClosed : L.joinComm
  absorptionClosed : L.absorption
  joinAbsorptionClosed : L.joinAbsorption

def LatticeClosed (L : LatticePackage) : Prop :=
  L.meetAssoc ∧ L.joinAssoc ∧ L.meetComm ∧ L.joinComm ∧ L.absorption ∧ L.joinAbsorption

theorem lattice_closed_from_evidence (L : LatticePackage) (E : LatticeEvidence L) :
    LatticeClosed L := by
  exact And.intro E.meetAssocClosed (And.intro E.joinAssocClosed (And.intro E.meetCommClosed (And.intro E.joinCommClosed (And.intro E.absorptionClosed E.joinAbsorptionClosed))))

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse