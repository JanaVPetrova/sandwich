# frozen_string_literal: true

RSpec.describe RecipesController do
  describe 'GET #index' do
    subject { get :index }

    before do
      create :recipe
    end

    it { is_expected.to have_http_status :ok }
  end

  describe 'GET #show' do
    subject { get :show, params: { slug: recipe.slug } }

    let(:recipe) { create :recipe }

    it { is_expected.to have_http_status :ok }
  end
end
