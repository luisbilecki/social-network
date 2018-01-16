require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:post) }
  it { is_expected.to validate_presence_of(:content) }

  context 'is valid' do
    it 'has a valid factory' do
      comment = create(:comment)
      expect(comment).to be_valid
    end
  end

  context 'is invalid' do

    it 'without user' do
     expect { create(:comment, user: nil) }.to raise_error(ActiveRecord::RecordInvalid,
                    "Validation failed: User must exist, User can't be blank")
    end

    it 'without post' do
      expect { create(:comment, post: nil) }.to raise_error(ActiveRecord::RecordInvalid,
                    "Validation failed: Post must exist, Post can't be blank")
    end

    it 'without content' do
      expect { create(:comment, content: nil) }.to raise_error(ActiveRecord::RecordInvalid,
                    "Validation failed: Content can't be blank")
    end

  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end


end
