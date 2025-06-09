require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  describe '#user_avatar' do
    let(:user) { create(:user) }

    it 'returns the default avatar when user has no avatar' do
      expect(helper.user_avatar(user)).to eq('default-avatar.png')
    end

    it 'returns the user avatar when user has an avatar' do
      user = create(:user, :with_avatar)
      expect(helper.user_avatar(user)).to eq('avatar.png')
    end
  end
end 