# frozen_string_literal: true

RSpec.describe Recipe do
  describe '#nutrition_fact' do
    subject { recipe.nutrition_fact }

    context 'when no recipe ingredients' do
      let(:recipe) { create :recipe }

      it { is_expected.to be_nil }
    end

    context 'when one of recipe ingredients has no nutrition fact' do
      let(:recipe) { ingredient_group.recipe }
      let(:ingredient_group) { create :ingredient_group }

      before do
        create(
          :recipe_ingredient,
          ingredient_group: ingredient_group,
          carbohydrates_g: nil,
          fat_g: nil,
          protein_g: nil
        )

        create(:recipe_ingredient, ingredient_group: ingredient_group)
      end

      it { is_expected.to be_nil }
    end

    context 'when all recipe ingredients have nutrition fact' do
      let(:recipe) { ingredient_group.recipe }
      let(:ingredient_group) { create :ingredient_group }

      before do
        create(:recipe_ingredient, ingredient_group: ingredient_group)
      end

      it { is_expected.to be_present }
    end
  end
end
