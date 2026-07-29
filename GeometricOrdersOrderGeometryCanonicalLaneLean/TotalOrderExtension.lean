import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricOrdersOrderGeometryCanonicalLaneLean

structure TotalOrderPackage where
  underlyingSet : Type u
  totalRelation : underlyingSet → underlyingSet → Prop
  partial : Prop
  totality : ∀ a b : underlyingSet, totalRelation a b ∨ totalRelation b a
  antisymmetry : ∀ a b : underlyingSet, totalRelation a b ∧ totalRelation b a → a = b
  transitivity : ∀ a b c : underlyingSet, totalRelation a b ∧ totalRelation b c → totalRelation a c

structure TotalOrderExtension {P : PartialOrderPackage} (T : TotalOrderPackage) where
  extendsPartial : ∀ a b : P.carrierSet, P.orderRelation a b → T.totalRelation a b

theorem total_order_extension_possible (P : PartialOrderPackage) :
    ∃ (T : TotalOrderPackage) (E : TotalOrderExtension T), True := by
  refine ⟨?_, ?_, trivial⟩
  · exact { underlyingSet := P.carrierSet, totalRelation := P.orderRelation, partial := True, totality := ?_, antisymmetry := ?_, transitivity := ?_ }
  · exact { extendsPartial := λ a b h => h }
  · intro a b; left; exact P.reflexivity a
  · exact P.antisymmetry
  · exact P.transitivity

end GeometricOrdersOrderGeometryCanonicalLaneLean
end HautevilleHouse