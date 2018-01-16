require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  before do
    user = create(:user)
    sign_in user
  end

  it 'render index page' do
    get :index
    expect(response).to render_template(:index)
  end
end
