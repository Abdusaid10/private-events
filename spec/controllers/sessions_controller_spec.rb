# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  fixtures :users
  before { @user = users(:first) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'add user_id to the session' do
      @user.save
      post :create, params: { session: { name: @user.name } }
      expect(session[:user_id]).to eq(@user.id)
      response.should redirect_to(root_url)
    end

    it "flash Unable to find user if user doesn't exist" do
      post :create, params: { session: { name: 'non_existing_name' } }
      expect(flash[:danger]).to eq('Unable to find user')
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
