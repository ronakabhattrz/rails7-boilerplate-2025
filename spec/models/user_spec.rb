require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do
    it { should have_one_attached(:avatar) }
    it { should have_many(:posts) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it 'has a valid factory with avatar' do
      expect(build(:user, :with_avatar)).to be_valid
    end

    it 'has a valid factory with posts' do
      expect(build(:user, :with_posts)).to be_valid
    end
  end

  describe '#to_s' do
    it 'returns the email' do
      user = build(:user, email: 'test@example.com')
      expect(user.to_s).to eq('test@example.com')
    end
  end
end
