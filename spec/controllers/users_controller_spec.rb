# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'successfully create user and signs in' do
      post :create, params: { user: { name: 'user_name', email: 'user_email@email.com' } }
      expect(User.last.name).to eq('user_name')
    end
  end
end
