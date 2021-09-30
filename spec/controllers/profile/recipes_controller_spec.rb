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

    describe 'when user logged-in' do
      before { sign_in user }

      it 'valid params' do
        is_expected.to redirect_to(profile_recipe_ingredient_groups_path(Recipe.last))
        is_expected.to have_http_status :found
      end

      context 'invalid params' do
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
end