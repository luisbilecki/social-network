require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user_n){FactoryBot.create :user}

  describe "as a Guest User" do
    it 'not_authorized - #index' do
      get :index
      expect(response).not_to be_success
    end

    it 'not_authorized - #search' do
      get :search, params: {q: "teste"}
      expect(response).not_to be_success

    end

    it 'not_authorized - #show' do
      get :show, params: { id: user_n.id}
      expect(response).to have_http_status "302"
    end

    it 'not_authorized - #showfollowing' do
      get :showfollowing
      expect(response).to have_http_status "302"
    end

    it 'not_authorized - #showfollowers' do
      get :showfollowers
      expect(response).to have_http_status "302"
    end
  end

  describe "as a Logged User" do
    before do
      user = create(:user)
      sign_in user
    end

    it '#index' do
      get :index
      expect(response).to render_template(:index)
    end

    it '#search' do
      get :search, params: {q: "teste"}
      expect(response).to render_template(:search)

    end

    it '#show' do
      get :show, params: { id: user_n.id}
      expect(response).to render_template(:show)
    end

    it '#showfollowing' do
      get :showfollowing
      expect(response).to render_template(:showfollowing)
    end

    it '#showfollowers' do
      get :showfollowers
      expect(response).to render_template(:showfollowers)
    end
  end

end
