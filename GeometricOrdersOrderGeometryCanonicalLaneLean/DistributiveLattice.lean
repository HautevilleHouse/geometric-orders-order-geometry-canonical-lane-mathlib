import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure DistributiveLatticePackage where
  carrierSet : Type u
  meet : carrierSet → carrierSet → carrierSet
  join : carrierSet → carrierSet → carrierSet
  meetAssoc : ∀ a b c : carrierSet, meet (meet a b) c = meet a (meet b c)
  joinAssoc : ∀ a b c : carrierSet, join (join a b) c = join a (join b c)
  meetComm : ∀ a b : carrierSet, meet a b = meet b a
  joinComm : ∀ a b : carrierSet, join a b = join b a
  absorption : ∀ a b : carrierSet, meet a (join a b) = a
  joinAbsorption : ∀ a b : carrierSet, join a (meet a b) = a
  distribMeetJoin : ∀ a b c : carrierSet, meet a (join b c) = join (meet a b) (meet a c)

def DistributiveLatticeClosed (D : DistributiveLatticePackage) : Prop :=
  D.meetAssoc ∧ D.joinAssoc ∧ D.meetComm ∧ D.joinComm ∧ D.absorption ∧ D.joinAbsorption ∧ D.distribMeetJoin

theorem distributive_lattice_closed (D : DistributiveLatticePackage) :
    DistributiveLatticeClosed D := by
  refine ⟨D.meetAssoc, D.joinAssoc, D.meetComm, D.joinComm, D.absorption, D.joinAbsorption, D.distribMeetJoin⟩

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse