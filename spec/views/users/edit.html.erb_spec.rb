require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  let(:user) { create(:user) }

  before do
    assign(:user, user)
    render
  end

  it 'displays the edit form' do
    expect(rendered).to have_field('Email')
    expect(rendered).to have_button('Update User')
  end
end 