# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the signup process', type: :feature do
  it 'signs me up' do
    visit '/signup'
    within('#signup') do
      fill_in 'Name', with: 'test2'
      fill_in 'Email', with: 'test2@test.com'
    end
    click_button 'Sign up'
    expect(page).to have_content 'test2'
  end
end
