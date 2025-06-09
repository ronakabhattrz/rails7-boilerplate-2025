require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/sign_up' do
    it 'returns a successful response' do
      get new_user_registration_path
      expect(response).to be_successful
    end
  end

  describe 'GET /users/sign_in' do
    it 'returns a successful response' do
      get new_user_session_path
      expect(response).to be_successful
    end
  end

  describe 'POST /users' do
    let(:valid_attributes) do
      {
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      }
    end

    it 'creates a new user' do
      expect {
        post user_registration_path, params: { user: valid_attributes }
      }.to change(User, :count).by(1)
    end

    it 'redirects to the root path' do
      post user_registration_path, params: { user: valid_attributes }
      expect(response).to redirect_to(root_path)
    end
  end
end
