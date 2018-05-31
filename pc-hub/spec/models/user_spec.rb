require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryBot.build(:user, name: nil)).to_not be_valid
  end

  it "is invalid without a country" do
    expect(FactoryBot.build(:user, country: nil)).to_not be_valid
  end

  it "is invalid without a city" do
    expect(FactoryBot.build(:user, city: nil)).to_not be_valid
  end

  it "is invalid without a email" do
    expect(FactoryBot.build(:user, email: nil)).to_not be_valid
  end

  it "it is invalid with a duplicate email address" do
    User.create(
      name: 'Name',
      country: 'Cameroon',
      city: 'Buea',
      role: 'volunteer',
      password: 'password',
      email: 'email@example.com'
    )
    user = User.new(
    name: 'Name', 
    country: 'Cameroon',
    city: 'Buea',
    role: 'staff',
    password: 'password',
    email: 'email@example.com'
  )
    user.valid?
      expect(user.errors[:email]).to include("has already been taken")
  end

  it "is invalid without a role" do
    expect(FactoryBot.build(:user, role: nil)).to_not be_valid
  end

  it "is invalid without a password" do
    expect(FactoryBot.build(:user, password: nil)).to_not be_valid
  end

  #TODO incoporate searching for a single letter
  it "returns a list of names results that match" do
    muhammed = User.create(
      name: 'Muhammed',
      country: 'Cameroon',
      city: 'Buea',
      role: 'staff',
      password: 'password',
      email: 'muhammed@example.com'
    )
 
    christian = User.create(
      name: 'Christian',
      country: 'Brazil',
      city: 'Rio',
      role: 'volunteer',
      password: 'password',
      email: 'christian@example.com'
    )
  
    may = User.create(
      name: 'May',
      country: 'Brazil',
      city: 'Rio',
      role: 'staff',
      password: 'password',
      email: 'may@example.com'
    )
    carine = User.create(
      name: 'Carine',
      country: 'Cameroon',
      city: 'Buea',
      role: 'volunteer',
      password: 'password',
      email: 'carine@example.com'
    )
    expect(User.search("%#'C'%")).to include [christian, carine]
  end

  it "returns a list of names results that match" do
    muhammed = User.create(
      name: 'Muhammed',
      country: 'Cameroon',
      city: 'Buea',
      role: 'staff',
      password: 'password',
      email: 'muhammed@example.com'
    )
 
    christian = User.create(
      name: 'Christian',
      country: 'Brazil',
      city: 'Rio',
      role: 'volunteer',
      password: 'password',
      email: 'christian@example.com'
    )
  
    may = User.create(
      name: 'May',
      country: 'Brazil',
      city: 'Rio',
      role: 'staff',
      password: 'password',
      email: 'may@example.com'
    )
    carine = User.create(
      name: 'Carine',
      country: 'Cameroon',
      city: 'Buea',
      role: 'volunteer',
      password: 'password',
      email: 'carine@example.com'
    )
    expect(User.search("%#{'C'}%")).to_not include [muhammed, may]
 end
end
