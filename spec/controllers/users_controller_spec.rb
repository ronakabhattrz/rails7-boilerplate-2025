require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    let(:user) { create(:user) }

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'returns a successful response' do
        get :show, params: { id: user.id }
        expect(response).to be_successful
      end
    end

    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH #update' do
    let(:user) { create(:user) }
    let(:new_attributes) do
      {
        email: 'newemail@example.com'
      }
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'updates the user' do
        patch :update, params: { id: user.id, user: new_attributes }
        user.reload
        expect(user.email).to eq('newemail@example.com')
      end

      it 'redirects to the user' do
        patch :update, params: { id: user.id, user: new_attributes }
        expect(response).to redirect_to(user)
      end
    end

    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        patch :update, params: { id: user.id, user: new_attributes }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create(:user) }

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'destroys the user' do
        expect {
          delete :destroy, params: { id: user.id }
        }.to change(User, :count).by(-1)
      end

      it 'redirects to the root path' do
        delete :destroy, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        delete :destroy, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #posts' do
    let(:user) { create(:user, :with_posts) }

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'returns a successful response' do
        get :posts, params: { id: user.id }
        expect(response).to be_successful
      end

      it 'assigns the user posts' do
        get :posts, params: { id: user.id }
        expect(assigns(:posts)).to eq(user.posts)
      end
    end

    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        get :posts, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
