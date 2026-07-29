import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometry

structure OrderTopologyPackage (G : GeometricOrderPackage) where
  orderSpace : TopologicalSpace G.carrier
  openIntervalsGenerate : Prop
  orderClosedSetsCharacterization : Prop
  orderCompactnessProperty : Prop

structure OrderTopologyEvidence {G : GeometricOrderPackage} (T : OrderTopologyPackage G) where
  openIntervalsGenerateClosed : T.openIntervalsGenerate
  orderClosedSetsCharacterizationClosed : T.orderClosedSetsCharacterization
  orderCompactnessPropertyClosed : T.orderCompactnessProperty

def OrderTopologyClosed {G : GeometricOrderPackage} (T : OrderTopologyPackage G) : Prop :=
  T.openIntervalsGenerate ∧ T.orderClosedSetsCharacterization ∧ T.orderCompactnessProperty

theorem order_topology_closed_from_evidence {G : GeometricOrderPackage} (T : OrderTopologyPackage G) (E : OrderTopologyEvidence T) :
    OrderTopologyClosed T := by
  exact And.intro E.openIntervalsGenerateClosed (And.intro E.orderClosedSetsCharacterizationClosed E.orderCompactnessPropertyClosed)

end GeometricOrdersOrderGeometry
end HautevilleHouse