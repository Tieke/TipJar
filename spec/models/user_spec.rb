require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe "relationships" do
    it { should have_one(:tipper) }
    it { should have_one(:tippee) }
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

  describe "has followers and followings" do
    let(:jane) {create(:user, username: 'jane')}
    let(:john) {create(:user, username: 'john')}

    before do
      @follow = Follow.create(follower_id: john.id, following_id: jane.id)
    end

    it { should have_many :follower_follows}

    it 'has many follower follows' do
      expect(john.follower_follows).to include(@follow)
    end

    it { should have_many :followings}

    it 'has many followings' do
      expect(john.followings).to include(jane)
    end

    it { should have_many :following_follows}

    it 'has many following_follows' do
      expect(jane.following_follows).to include(@follow)
    end

    it { should have_many :followers}

    it 'has many follows' do
      expect(jane.followers).to include(john)
    end


  end


  after do
    Follow.destroy_all
    User.destroy_all
  end
end
