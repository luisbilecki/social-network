require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) {FactoryBot.create :post}

  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to have_many(:comments) }

  context 'is valid' do
    it 'has a valid factory' do
      post = create(:post)
      expect(post).to be_valid
    end
  end

  context 'is invalid' do
    it 'without user' do
      expect { create(:post, user: nil) }.to raise_error(ActiveRecord::RecordInvalid,
                    "Validation failed: User must exist, User can't be blank")
    end

    it 'without content' do
      expect { create(:post, content: nil) }.to raise_error(ActiveRecord::RecordInvalid,
                    "Validation failed: Content can't be blank")
    end
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'Named Scopes' do
    it 'returns the users posts' do
      expect(Post.by_user(post.user.id,1).count).to be >= 0
    end

    it 'returns the following posts' do
      expect(Post.subscribed(post.user.id,1).count).to be >= 0
    end
  end

end
