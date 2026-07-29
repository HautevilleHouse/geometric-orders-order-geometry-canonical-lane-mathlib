import canonicalLaneMathlib.AdmissibleClass

/-!
# Geometric Order Structure Package
-/

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure GeometricOrderStructure where
  carrier : Type u
  preorder : Preorder carrier
  convexity : Prop
  convexityTerm : convexity
  geodesicContinuity : Prop
  geodesicContinuityTerm : geodesicContinuity

structure GeometricOrderEvidence (G : GeometricOrderStructure) where
  convexityClosed : G.convexity
  geodesicContinuityClosed : G.geodesicContinuity

def GeometricOrderClosed (G : GeometricOrderStructure) : Prop :=
  G.convexity ∧ G.geodesicContinuity

theorem geometric_order_closed_from_evidence (G : GeometricOrderStructure) (E : GeometricOrderEvidence G) :
    GeometricOrderClosed G := by
  exact And.intro E.convexityClosed E.geodesicContinuityClosed

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse
