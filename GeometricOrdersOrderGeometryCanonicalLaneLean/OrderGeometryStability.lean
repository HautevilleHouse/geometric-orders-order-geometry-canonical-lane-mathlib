import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure AsymptoticOrderStabilityPackage where
  equilibriumPoint : Type
  neighborhoodOrder : Type → Type
  lyapunovFunction : Type
  monotoneDecay : Prop
  deltaEpsilonInput : Prop
  stableSetCharacterization : Prop

structure AsymptoticOrderStabilityEvidence (P : AsymptoticOrderStabilityPackage) where
  monotoneDecayClosed : P.monotoneDecay
  deltaEpsilonInputClosed : P.deltaEpsilonInput
  stableSetCharacterizationClosed : P.stableSetCharacterization

def AsymptoticOrderStabilityClosed (P : AsymptoticOrderStabilityPackage) : Prop :=
  P.monotoneDecay ∧ P.deltaEpsilonInput ∧ P.stableSetCharacterization

theorem asymptotic_order_stability_closed_from_evidence (P : AsymptoticOrderStabilityPackage)
    (E : AsymptoticOrderStabilityEvidence P) : AsymptoticOrderStabilityClosed P := by
  exact And.intro E.monotoneDecayClosed
    (And.intro E.deltaEpsilonInputClosed E.stableSetCharacterizationClosed)

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse