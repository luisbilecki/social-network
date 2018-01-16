require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:comment_test){FactoryBot.create :comment}

  describe "as a Guest User" do

    it 'not_authorized - #create' do
      comment_params = attributes_for(:comment)
      post :create, params: {comment: comment_params}

      expect(response).not_to be_success
    end

    it 'not_authorized - #update' do
      put :update, params: {id: comment_test.id, comment: comment_test.attributes}

      expect(response).not_to be_success
    end

    it 'not_authorized - #destroy' do
      delete :destroy, params: {id: comment_test.id}
      expect(response).not_to be_success
    end

  end

  describe "as a Logged User" do

    before do
      user = create(:user)
      sign_in user
    end

    it '#create' do
      com = build(:comment)

      expect {
        post :create, params: {comment: com.attributes.except("id")}
        }.to change(Comment, :count)

    end

    it '#create - flash notice' do
      com = build(:comment)
      post :create, params: {comment: com.attributes.except("id")}

      expect(flash[:notice]).to match(/was inserted/)
    end

    it '#update' do
      put :update, params: {id: comment_test.id, comment: comment_test.attributes}

      expect(response).to redirect_to(root_path)
    end

    it '#update - flash notice' do
      put :update, params: {id: comment_test.id, comment: comment_test.attributes}

      expect(flash[:notice]).to match(/has been updated/)
    end

    it '#destroy' do
      delete :destroy, params: {id: comment_test.id}
      expect(response).to redirect_to(root_path)
    end


  end
end
