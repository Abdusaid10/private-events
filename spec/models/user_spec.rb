require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  it "creates new valid user" do
    user= User.new( name: "Sam", email: "sam@gmail.com")
    expect(user).to be_valid
  end

  it "is invalid without user name" do
    user= User.new( name: nil, email: "sam@gmail.com")
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without user email" do
    user= User.new( name: "Sam", email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with user name longer than specified" do
    user= User.new( name: "ababa"*12, email: "")
    user.valid?
    expect(user.errors[:name]).to include("can't be longer than 50 chars")
  end

  it "creates new valid user" do
    user= User.new( name: "Sam", email: "sam@gmail.com")
    user1= User.new( name: "Sam", email: "sam@gmail.com")
    user1.valid?
    expect(user1.errors[:email]).to include("has already taken")
  end

end
