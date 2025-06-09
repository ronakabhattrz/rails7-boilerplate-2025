require 'rails_helper'

RSpec.describe 'users/posts', type: :view do
  let(:user) { create(:user, :with_posts) }

  before do
    assign(:user, user)
    assign(:posts, user.posts)
    render
  end

  it 'displays the user posts' do
    expect(rendered).to have_content(user.posts.first.title)
    expect(rendered).to have_content(user.posts.first.content)
  end

  it 'displays the user email' do
    expect(rendered).to have_content(user.email)
  end

  it 'displays the user avatar' do
    expect(rendered).to have_css('img[src*="default-avatar.png"]')
  end
end
