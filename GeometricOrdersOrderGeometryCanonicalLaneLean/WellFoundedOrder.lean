import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure WellFoundedOrder where
  carrierSet : Type u
  orderRelation : carrierSet → carrierSet → Prop
  reflexivity : ∀ a : carrierSet, orderRelation a a
  transitivity : ∀ a b c : carrierSet, orderRelation a b ∧ orderRelation b c → orderRelation a c
  antisymmetry : ∀ a b : carrierSet, orderRelation a b ∧ orderRelation b a → a = b
  wellFounded : WellFounded (λ a b => orderRelation a b ∧ a ≠ b)

structure WellFoundedOrderEvidence (W : WellFoundedOrder) where
  reflexivityClosed : W.reflexivity
  transitivityClosed : W.transitivity
  antisymmetryClosed : W.antisymmetry
  wellFoundedClosed : W.wellFounded

def WellFoundedOrderClosed (W : WellFoundedOrder) : Prop :=
  W.reflexivity ∧ W.transitivity ∧ W.antisymmetry ∧ W.wellFounded

theorem well_founded_order_closed_from_evidence (W : WellFoundedOrder) (E : WellFoundedOrderEvidence W) :
    WellFoundedOrderClosed W := by
  exact And.intro E.reflexivityClosed (And.intro E.transitivityClosed (And.intro E.antisymmetryClosed E.wellFoundedClosed))

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse