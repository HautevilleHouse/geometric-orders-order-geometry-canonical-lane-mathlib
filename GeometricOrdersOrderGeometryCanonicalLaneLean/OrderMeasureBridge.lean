import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometry

structure OrderMeasurePackage (G : GeometricOrderPackage) where
  measure : G.carrier → ℝ
  monotoneOrderMeasure : Prop
  measureRespectsOrder : Prop
  measureContinuity : Prop

structure OrderMeasureEvidence {G : GeometricOrderPackage} (M : OrderMeasurePackage G) where
  monotoneOrderMeasureClosed : M.monotoneOrderMeasure
  measureRespectsOrderClosed : M.measureRespectsOrder
  measureContinuityClosed : M.measureContinuity

def OrderMeasureClosed {G : GeometricOrderPackage} (M : OrderMeasurePackage G) : Prop :=
  M.monotoneOrderMeasure ∧ M.measureRespectsOrder ∧ M.measureContinuity

theorem order_measure_closed_from_evidence {G : GeometricOrderPackage} (M : OrderMeasurePackage G) (E : OrderMeasureEvidence M) :
    OrderMeasureClosed M := by
  exact And.intro E.monotoneOrderMeasureClosed (And.intro E.measureRespectsOrderClosed E.measureContinuityClosed)

end GeometricOrdersOrderGeometry
end HautevilleHouse