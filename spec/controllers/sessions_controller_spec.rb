RSpec.describe SessionsController do
  describe 'GET #new' do
    subject { get :new }

    it { is_expected.to have_http_status :ok }
  end

  describe 'POST #create' do
    subject { post :create, params: { session: params } }

    let(:user) { create :user, password: password }
    let(:password) { Faker::Internet.password }

    context 'when user exists' do
      let(:params) do
        {
          email: user.email,
          password: password
        }
      end

      it 'signs in' do
        is_expected.to redirect_to root_path
        expect(current_user).to eq user
      end
    end

    context 'when password is incorrect' do
      let(:params) do
        {
          email: user.email,
          password: "#{password}1"
        }
      end

      it do
        is_expected.to have_http_status :ok
        expect(current_user).to be_nil
      end
    end
  end

  describe 'DELETE #destroy' do
    subject(:do_request) { delete :destroy }

    let(:user) { create :user }

    before { sign_in user }

    it 'signs out' do
      do_request

      expect(current_user).to be_nil
    end
  end
end
