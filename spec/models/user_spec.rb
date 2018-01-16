require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){FactoryBot.create :user}

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:avatar) }
  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:following) }

  context 'is valid' do
    it 'has a valid factory' do
      user = create(:user)
      expect(user).to be_valid
    end
  end

  context 'is invalid' do

    it 'without email' do
     expect { create(:user, email: nil) }.to raise_error(ActiveRecord::RecordInvalid,
                  "Validation failed: Email can't be blank")
    end

    it 'without password' do
      expect { create(:user, password: nil) }.to raise_error(ActiveRecord::RecordInvalid,
                    "Validation failed: Password can't be blank")
    end

  end

  context 'Named Scopes' do
    it 'searching profiles' do
      expect(User.search(user.name,1).count).to be >= 0
    end

    it 'showing users' do
      expect(User.filter_all(1).count).to be >= 0
    end
  end
end
