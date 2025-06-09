require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  it 'displays the welcome message' do
    render
    expect(rendered).to have_content('Welcome to Rails7 Boilerplate 2025')
  end

  it 'displays the features section' do
    render
    expect(rendered).to have_content('Authentication')
    expect(rendered).to have_content('Modern UI')
    expect(rendered).to have_content('Testing')
  end

  it 'displays the getting started section' do
    render
    expect(rendered).to have_content('Getting Started')
  end
end
