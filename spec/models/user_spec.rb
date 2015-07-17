require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_one(:tipper) }
    it { should have_one(:tippee) }
    it { should have_many(:tips) }
    it { should have_many(:withdrawals)}
    it { should have_many(:deposits)}
  end

  describe "validations" do
    let!(:user) { create(:user) }

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

  after do
    User.destroy_all
  end
end
