# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the signin process', type: :feature do
  before :each do
    @user = User.create(name: 'test', email: 'test@test.com')
  end

  it 'signs me in' do
    visit '/login'
    within('#session') do
      fill_in 'Email', with: 'test@test.com'
    end
    click_button 'Log in'
    expect(page).to have_content 'test'
  end
end
