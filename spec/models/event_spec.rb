require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'creates new valid event' do
    event = Event.new(title: 'New event', url: 'https://www.gmail.com', date: 3.days.after, user_id: 1)
    expect(event).to be_valid
  end

  it 'is invalid without event title' do
    event = Event.new(title: nil, url: 'https://www.gmail.com', date: 3.days.after, user_id: 1)
    event.valid?
    expect(event.errors[:title]).to include("can't be blank")
  end

  it 'is invalid without event email' do
    event = Event.new(title: 'New event', url: nil, date: 3.days.after, user_id: 1)
    event.valid?
    expect(event.errors[:url]).to include("can't be blank")
  end

  it 'is invalid with event title longer than specified' do
    event = Event.new(title: 'ababa' * 100, url: 'https://www.gmail.com', date: 3.days.after, user_id: 1)
    event.valid?
    expect(event.errors[:title]).to include('is too long (maximum is 100 characters)')
  end
end
