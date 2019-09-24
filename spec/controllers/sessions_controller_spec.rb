# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before :each do
    @user = User.create(name: 'test', email: 'test@test.com')
  end
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  describe 'POST #new' do
    it 'login user' do
      post :new, params: { session: { email: 'test@test.com' } }
      expect(response).to have_http_status(:success)
    end
  end
  describe 'DELETE #destroy' do
    it 'logs out if user is logged in' do
      session[:user_id] = 1
      delete :destroy
      expect(session[:user_id]).to be_nil
      response.should redirect_to(root_url)
    end
  end
end
