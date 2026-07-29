import canonicalLaneMathlib.AdmissibleClass
import GeometricOrdersOrderGeometryCanonicalLaneLean.GeometricOrderStructure

/-!
# Ordered Metric Space Package
-/

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure OrderedMetricSpace {G : GeometricOrderStructure} where
  metric : G.carrier → G.carrier → ℝ
  metricSpace : MetricSpace G.carrier
  orderCompatibility : ∀ x y z : G.carrier, x ≤ y → metric x z ≤ metric y z
  orderCompatibilityTerm : orderCompatibility

structure OrderedMetricSpaceEvidence {G : GeometricOrderStructure} (M : OrderedMetricSpace G) where
  orderCompatibilityClosed : M.orderCompatibility

def OrderedMetricSpaceClosed {G : GeometricOrderStructure} (M : OrderedMetricSpace G) : Prop :=
  M.orderCompatibility

theorem ordered_metric_space_closed_from_evidence {G : GeometricOrderStructure} (M : OrderedMetricSpace G)
    (E : OrderedMetricSpaceEvidence M) : OrderedMetricSpaceClosed M := by
  exact E.orderCompatibilityClosed

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse
