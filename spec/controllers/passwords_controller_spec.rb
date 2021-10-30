# frozen_string_literal: true

RSpec.describe PasswordsController do
  describe 'GET #show' do
    subject { get :show }

    it { is_expected.to have_http_status :ok }
  end

  describe 'GET #edit' do
    subject { get :edit }

    it { is_expected.to have_http_status :ok }
  end

  describe 'POST #recover' do
    subject { post :recover, params: params }

    context 'when user exists' do
      let(:user) { create :user }
      let(:params) { { password_reset: { email: user.email } } }

      it 'creates a recovery token' do
        expect { subject }.to change { user.password_recovery_tokens.count }.by(1)
        is_expected.to be_redirect
      end
    end

    context 'when user does not exist' do
      let(:params) { { password_reset: { email: Faker::Internet.email } } }

      it { is_expected.to have_http_status :ok }
    end
  end

  describe 'PATCH #update' do
    subject { patch :update, params: params }

    let(:password) { Faker::Internet.password }
    let(:params) do
      {
        password_reset: {
          token_value: token_value,
          password: password,
          password_confirmation: password
        }
      }
    end

    context 'when token is valid' do
      let(:token) { create :token }
      let(:user) { token.user }
      let(:token_value) { token.value }

      it 'resets the password' do
        is_expected.to be_redirect
        expect(user.reload.authenticate(password)).to be user
      end
    end

    context 'when does not exist' do
      let(:token_value) { Faker::Internet.password }

      it { is_expected.to have_http_status :ok }
    end
  end
end
