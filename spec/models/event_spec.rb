# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @user = User.create(name: 'test', email: 'test@test.com')
  end

  it 'creates new valid event' do
    event = @user.events.create(title: 'New event', description: '', url: 'https://www.gmail.com', date: 3.days.after)
    expect(event).to be_valid
  end

  it 'is invalid without event title' do
    event = @user.events.new(title: nil, url: 'https://www.gmail.com', date: 3.days.after)
    event.valid?
    expect(event.errors[:title]).to include("can't be blank")
  end

  it 'is invalid without event url' do
    event = @user.events.new(title: 'New event', url: nil, date: 3.days.after)
    event.valid?
    expect(event.errors[:url]).to include("can't be blank")
  end

  it 'is invalid with event title longer than specified' do
    event = @user.events.new(title: 'ababa' * 100, url: 'https://www.gmail.com', date: 3.days.after)
    event.valid?
    expect(event.errors[:title]).to include('is too long (maximum is 100 characters)')
  end
end
