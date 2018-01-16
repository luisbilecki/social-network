require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:post_n){FactoryBot.create :post}

  describe "as a Guest User" do

    it 'not_authorized - #create' do
      post_params = attributes_for(:post)
      post :create, params: {post: post_params}

      expect(response).not_to be_success
    end

    it 'not_authorized - #update' do
      put :update, params: {id: post_n.id, post: post_n.attributes}

      expect(response).not_to be_success
    end

    it 'not_authorized - #like' do
      put :like, params: {id: post_n.id}

      expect(response).not_to be_success
    end

    it 'not_authorized - #destroy' do
      delete :destroy, params: {id: post_n.id}
      expect(response).not_to be_success
    end
  end

  describe "as a Logged User" do

    before do
      user = create(:user)
      sign_in user
    end

    it '#create' do
      post_params = attributes_for(:post)

      expect {
      post :create, params: {post: post_params}}.to change(Post, :count)
    end

    it '#create - flash notice' do
      post_params = attributes_for(:post)
      post :create, params: {post: post_params}

      expect(flash[:notice]).to match(/was inserted/)
    end

    it '#update' do
      put :update, params: {id: post_n.id, post: post_n.attributes}

      expect(response).to redirect_to(users_index_path)
    end

    it '#update - flash notice' do
      put :update, params: {id: post_n.id, post: post_n.attributes}

      expect(flash[:notice]).to match(/has been updated/)
    end

    it '#like' do
      put :like, params: {id: post_n.id}

      expect(response).to redirect_to(root_path)
    end

    it '#destroy' do
      delete :destroy, params: {id: post_n.id}
      expect(response).to redirect_to(users_index_path)
    end


  end
end
