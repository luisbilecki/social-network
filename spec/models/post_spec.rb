require 'rails_helper'

RSpec.describe Post, type: :model do
  #it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to have_many(:comments) }

  context 'is valid' do
    it 'has a valid factory' do
      expect(build(:post)).to be_valid
    end
  end

  context 'is invalid' do

    #it 'without user' do
     # expect { create(:post, user: nil) }.to raise_error(ActiveRecord::RecordInvalid,
                    #"Validation failed: User can't be nil")
    #end

    it 'without content' do
      expect { create(:post, content: nil) }.to raise_error(ActiveRecord::RecordInvalid,
                    "Validation failed: Content can't be blank")
    end

  end
end
