require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  #it { is_expected.to validate_presence_of(:avatar) }
  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:following) }

  context 'is valid' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
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

    #it 'without avatar' do
      #expect { create(:user, avatar: nil) }.to raise_error(ActiveRecord::RecordInvalid,
                    #{}"Validation failed: Avatar can't be blank")
    #end


  end
end
