require 'rails_helper'

RSpec.describe FollowersController, type: :controller do
  let(:user_n1){FactoryBot.create :user}
  let(:user_n2){FactoryBot.create :user}
  let(:follower_test){FactoryBot.create :follower}

  describe "as a Guest User" do
    it 'not_authorized - #follow' do
      get :follow, params: {id: user_n2.id}

      expect(response).not_to be_success
    end

    it 'not_authorized - #unfollow' do
      get :unfollow, params: {id: follower_test.id}

      expect(response).not_to be_success
    end
  end

  describe "as a Logged User" do
    before do
      sign_in user_n1
    end

    it '#follow' do
      get :follow, params: {id: user_n2.id}

      expect(flash[:notice]).to match(/Yay! You're following/)
    end

    it '#unfollow' do
      get :unfollow, params: {id: follower_test.id}

      expect(flash[:notice]).to match(/Ok! Unfollow/)
    end

  end
end
