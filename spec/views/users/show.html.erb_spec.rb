require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  let(:user) { create(:user) }

  before do
    assign(:user, user)
    render
  end

  it 'displays the user email' do
    expect(rendered).to have_content(user.email)
  end

  it 'displays the user avatar' do
    expect(rendered).to have_css('img[src*="default-avatar.png"]')
  end

  it 'displays the edit profile link' do
    expect(rendered).to have_link('Edit Profile', href: edit_user_path(user))
  end

  it 'displays the delete account button' do
    expect(rendered).to have_button('Delete Account')
  end
end 