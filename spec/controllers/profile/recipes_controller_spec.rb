# frozen_string_literal: true

RSpec.describe Profile::RecipesController do
  describe 'GET #new' do
    subject { get :new }

    let(:user) { create :user }

    context 'when user logged-in' do
      before { sign_in user }

      it { is_expected.to have_http_status :ok }
    end

    context 'when user not logged-in' do
      it { is_expected.to have_http_status :not_found }
    end
  end

  describe 'GET #show' do
    subject { get :show, params: { id: recipe.id } }

    let(:user) { create :user }
    let(:recipe) { create :recipe, user: user }

    context 'when user logged-in' do
      before { sign_in user }

      it { is_expected.to have_http_status :ok }
    end

    context 'when user not logged-in' do
      it { is_expected.to have_http_status :not_found }
    end
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    let(:user) { create :user }
    let(:params) do
      {
        recipe: {
          title: Faker::Food.dish,
          body: Faker::Food.description
        }
      }
    end

    context 'when user not logged-in' do
      it { is_expected.to have_http_status :not_found }
    end

    context 'when user logged-in' do
      before { sign_in user }

      it 'succeeds' do
        expect(subject).to redirect_to(profile_recipe_ingredient_groups_path(Recipe.last))
        expect(subject).to have_http_status :found
      end

      context 'when invalid params passed' do
        let(:params) do
          {
            recipe: {
              title: '',
              body: ''
            }
          }
        end

        it { is_expected.to have_http_status :ok }
      end
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: recipe.id } }

    let(:user) { create :user }
    let(:recipe) { create :recipe, user: user }

    before { sign_in user }

    it { is_expected.to have_http_status :ok }
  end

  describe 'GET #edit_details' do
    subject { get :edit_details, params: { id: recipe.id } }

    let(:user) { create :user }
    let(:recipe) { create :recipe, user: user }

    before { sign_in user }

    it { is_expected.to have_http_status :ok }
  end

  describe 'PUT #update' do
    subject { put :update, params: { id: recipe.id, recipe: params } }

    let(:recipe) { create :recipe }
    let(:params) { attributes_for(:recipe) }

    before do
      sign_in recipe.user
    end

    it do
      expect { subject }.to change { recipe.reload.attributes.symbolize_keys.slice(*params.keys) }.to(params)

      is_expected.to be_redirect
    end
  end
end
