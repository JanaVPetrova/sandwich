# frozen_string_literal: true

RSpec.describe Profile::Recipes::NutritionFactsController do
  let(:user) { create :user }

  before { sign_in user }

  describe 'GET #index' do
    subject { get :index, params: { recipe_slug: recipe.slug } }

    let(:recipe) { create :recipe, user: user }

    it { is_expected.to have_http_status :ok }
  end

  describe 'GET #edit' do
    subject { get :edit, params: { recipe_slug: recipe.slug, id: recipe_ingredient.id } }

    let(:recipe) { create :recipe, user: user }
    let(:recipe_ingredient) { create :recipe_ingredient, recipe: recipe }

    it { is_expected.to have_http_status :ok }
  end

  describe 'PUT #update' do
    subject do
      put(
        :update,
        params: { recipe_slug: recipe.slug, id: recipe_ingredient.id, recipe_ingredient: params },
        format: :turbo_stream
      )
    end

    let(:recipe) { create :recipe, user: user }
    let(:recipe_ingredient) { create :recipe_ingredient, recipe: recipe }
    let(:params) do
      {
        protein_g: Faker::Number.between(from: 1, to: 100),
        fat_g: Faker::Number.between(from: 1, to: 100),
        carbohydrates_g: Faker::Number.between(from: 1, to: 100)
      }
    end

    it do
      expect { subject }.
        to change { recipe_ingredient.reload.attributes.symbolize_keys.slice(:protein_g, :fat_g, :carbohydrates_g) }.
        to(params)

      is_expected.to have_http_status :ok
    end
  end
end
