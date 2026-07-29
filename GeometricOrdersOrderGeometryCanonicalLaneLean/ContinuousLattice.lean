import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometry

structure ContinuousLatticePackage (G : GeometricOrderPackage) where
  latticeStructure : Lattice G.carrier
  meetContinuous : Prop
  joinContinuous : Prop
  distributiveLaw : Prop

structure ContinuousLatticeEvidence {G : GeometricOrderPackage} (L : ContinuousLatticePackage G) where
  meetContinuousClosed : L.meetContinuous
  joinContinuousClosed : L.joinContinuous
  distributiveLawClosed : L.distributiveLaw

def ContinuousLatticeClosed {G : GeometricOrderPackage} (L : ContinuousLatticePackage G) : Prop :=
  L.meetContinuous ∧ L.joinContinuous ∧ L.distributiveLaw

theorem continuous_lattice_closed_from_evidence {G : GeometricOrderPackage} (L : ContinuousLatticePackage G) (E : ContinuousLatticeEvidence L) :
    ContinuousLatticeClosed L := by
  exact And.intro E.meetContinuousClosed (And.intro E.joinContinuousClosed E.distributiveLawClosed)

end GeometricOrdersOrderGeometry
end HautevilleHouse