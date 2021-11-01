# frozen_string_literal: true

RSpec.describe Profile::Recipes::IngredientGroupsController do
  describe 'GET #index' do
    subject { get :index, params: { recipe_slug: recipe_slug } }

    let(:user) { create :user }
    let(:recipe_slug) { create :recipe, user: user }

    context 'when user logged-in' do
      before { sign_in user }

      it { is_expected.to have_http_status :ok }
    end

    context 'when user not logged-in' do
      it { is_expected.to have_http_status :not_found }
    end
  end

  describe 'GET #new' do
    subject { get :new, params: { recipe_slug: recipe_slug } }

    let(:user) { create :user }
    let(:recipe_slug) { create :recipe, user: user }

    context 'when user logged-in' do
      before { sign_in user }

      it { is_expected.to have_http_status :ok }
    end

    context 'when user not logged-in' do
      it { is_expected.to have_http_status :not_found }
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { recipe_slug: recipe.slug, ingredient_group: params }, format: :turbo_stream }

    let(:user) { create :user }
    let(:recipe) { create :recipe, user: user }
    let(:params) do
      {
        title: Faker::Food.ingredient
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

  describe 'GET #edit' do
    subject { get :edit, params: { recipe_slug: recipe.slug, id: ingredient_group.id } }

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

  describe 'PATCH #update' do
    subject { patch :edit, params: { recipe_slug: recipe.slug, id: ingredient_group.id, ingredient_group: params } }

    let(:user) { create :user }
    let(:recipe) { create :recipe, user: user }
    let(:ingredient_group) { create :ingredient_group, recipe: recipe }
    let(:params) do
      {
        title: Faker::Food.ingredient
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
