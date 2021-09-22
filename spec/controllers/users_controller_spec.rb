RSpec.describe UsersController do
  describe 'GET #new' do
    subject { get :new }

    it do
      is_expected.to have_http_status :ok
    end
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    let(:params) do
      {
        user: {
          name: 'Yana',
          email: 'yana@mail.com',
          password: '123456',
          password_confirmation: '123456'
        }
      }
    end

    it 'creates user' do
      expect { subject }.to change { User.count }.by(1)
      is_expected.to be_redirect
    end

    context 'when params are invalid' do
      let(:params) do
        {
          user: {
            name: 'Yana',
            email: 'yana@email.com',
            password: '123',
            password_confirmation: '123'
          }
        }
      end

      it do
        expect { subject }.not_to change { User.count }
        expect(subject).to have_http_status :ok
      end
    end
  end
end
