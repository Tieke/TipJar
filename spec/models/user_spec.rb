require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe "relationships" do
    it { should have_one(:tipper) }
    it { should have_one(:tippee) }
    it { should have_many(:tips) }
    it { should have_many(:withdrawals)}
    it { should have_many(:deposits)}
  end

  describe "validations" do
    it "has a username" do
      expect(user).to validate_presence_of(:username)
    end

    it "has a unique username" do
      expect(user).to validate_uniqueness_of(:username)
    end

    it "has an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "has a password" do
      expect(user).to validate_presence_of(:password)
    end
  end

  describe "#increase_balance" do
    it "increases the balance by the specified amount" do
      user.increase_balance(0.01)
      expect(user.balance).to eq(10.01)
    end
  end

  describe "#decrease_balance" do
    it "reduces the balance by the specified amount" do
      user.decrease_balance(1.01)
      expect(user.balance).to eq(8.99)
    end
  end

  after do
    User.destroy_all
  end
end
