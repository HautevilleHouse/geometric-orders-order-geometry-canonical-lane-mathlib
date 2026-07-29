import canonicalLaneMathlib.AdmissibleClass
import GeometricOrdersOrderGeometryCanonicalLaneLean.GeometricOrderStructure

/-!
# Geodesic Continuity Package
-/

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure GeodesicContinuityPackage {G : GeometricOrderStructure} where
  geodesicPath : G.carrier → G.carrier → ℝ → G.carrier
  continuityCondition : Prop
  continuityConditionTerm : continuityCondition

structure GeodesicContinuityEvidence {G : GeometricOrderStructure} (P : GeodesicContinuityPackage G) where
  continuityConditionClosed : P.continuityCondition

def GeodesicContinuityClosed {G : GeometricOrderStructure} (P : GeodesicContinuityPackage G) : Prop :=
  P.continuityCondition

theorem geodesic_continuity_closed_from_evidence {G : GeometricOrderStructure} (P : GeodesicContinuityPackage G)
    (E : GeodesicContinuityEvidence P) : GeodesicContinuityClosed P := by
  exact E.continuityConditionClosed

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse
