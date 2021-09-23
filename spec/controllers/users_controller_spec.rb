RSpec.describe UsersController do
  describe 'GET #new' do
    subject { get :new }

    it { is_expected.to have_http_status :ok }
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    let(:params) do
      {
        user: {
          email: 'test@example.com',
          name: 'Example User',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end

    it 'when user created' do
      expect { subject }.to change { User.count }.by(1)
      is_expected.to redirect_to(new_session_path)
      is_expected.to have_http_status :found
    end

    context 'when params are invalid' do
      let(:params) do
        {
          user: {
            email: 'test@example.com',
            name: 'Example User',
            password: 'password',
            password_confirmation: ''
          }
        }
      end

      it do
        expect { subject }.to_not change { User.count }
        is_expected.to have_http_status :ok
      end
    end
  end
end