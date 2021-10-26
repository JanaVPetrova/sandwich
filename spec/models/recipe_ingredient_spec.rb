# frozen_string_literal: true

RSpec.describe RecipeIngredient do
  describe '#nutrition_fact' do
    subject { recipe_ingredient.nutrition_fact }

    context 'when recipe ingredient has no nutrition values' do
      let(:recipe_ingredient) do
        create(
          :recipe_ingredient,
          carbohydrates_g: nil,
          fat_g: nil,
          protein_g: nil
        )
      end

      it { is_expected.to be_nil }
    end

    context 'when recipe ingredient quantity unit is non-trivial' do
      let(:recipe_ingredient) { create(:recipe_ingredient, unit: 'g') }

      it { is_expected.to be_present }
    end

    context 'when recipe ingredient quantity unit is trivial' do
      context 'when recipe ingredient has a unit weight' do
        let(:recipe_ingredient) { create(:recipe_ingredient, unit: 'handful', unit_g: 100) }

        it { is_expected.to be_present }
      end

      context 'when recipe ingredient has no unit weight' do
        let(:recipe_ingredient) { create(:recipe_ingredient, unit: 'handful', unit_g: nil) }

        it { is_expected.to be_nil }
      end
    end

    context 'when all recipe ingredients have nutrition fact' do
      let(:recipe_ingredient) { create(:recipe_ingredient) }

      it { is_expected.to be_present }
    end
  end
end
