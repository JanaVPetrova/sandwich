# frozen_string_literal: true

RSpec.describe Profile::Recipes::IngredientGroups::RecipeIngredientsController do
  describe 'GET #new' do
    subject {
      get :new,
          params:
          {
            recipe_id: recipe.id,
            ingredient_group_id: ingredient_group.id
          }
    }

    let(:user) { create :user }
    let(:recipe) { create :recipe, user: user }
    let(:ingredient_group) { create :ingredient_group, recipe: recipe }

    context 'when user logged-in' do
      before { sign_in user }

      it { is_expected.to have_http_status :ok }
    end

    context 'when user not logged-in' do
      it { is_expected.to have_http_status :not_found }
    end
  end

  describe 'POST #create' do
    subject {
      post :create,
           params: {
             recipe_id: recipe.id,
             ingredient_group_id: ingredient_group.id,
             recipe_ingredient: recipe_ingredient
           },
           format: :turbo_stream
    }

    let(:user) { create :user }
    let(:recipe) { create :recipe, user: user }
    let(:ingredient_group) { create :ingredient_group, recipe: recipe }
    let(:recipe_ingredient) do
      {
        title: Faker::Food.ingredient,
        quantity: Faker::Number.number(digits: 2),
        unit: Faker::String.random(length: 2)
      }
    end

    context 'when user logged-in' do
      before { sign_in user }

      it { is_expected.to have_http_status :ok }
    end

    context 'when user not logged-in' do
      it { is_expected.to have_http_status :not_found }
    end
  end
end
