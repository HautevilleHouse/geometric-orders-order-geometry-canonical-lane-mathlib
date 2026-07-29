import canonicalLaneMathlib.AdmissibleClass
import GeometricOrdersOrderGeometryCanonicalLaneLean.GeometricOrderStructure

/-!
# Convexity Bridge Package
-/

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure ConvexityBridgePackage {G : GeometricOrderStructure} where
  convexCombination : G.carrier → G.carrier → ℝ → G.carrier
  convexClosure : Set G.carrier → Set G.carrier
  convexityPreserved : Prop
  convexityPreservedTerm : convexityPreserved

structure ConvexityBridgeEvidence {G : GeometricOrderStructure} (B : ConvexityBridgePackage G) where
  convexityPreservedClosed : B.convexityPreserved

def ConvexityBridgeClosed {G : GeometricOrderStructure} (B : ConvexityBridgePackage G) : Prop :=
  B.convexityPreserved

theorem convexity_bridge_closed_from_evidence {G : GeometricOrderStructure} (B : ConvexityBridgePackage G)
    (E : ConvexityBridgeEvidence B) : ConvexityBridgeClosed B := by
  exact E.convexityPreservedClosed

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse
