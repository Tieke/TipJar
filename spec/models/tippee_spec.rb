require 'rails_helper'

RSpec.describe Tippee, type: :model do
  describe "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:tips) }
  end

  describe "#generate_tippee_token" do
    let!(:tippee) { create(:tippee) }

    it "generates a random tippee token" do
      expect{ tippee.generate_tippee_token }.to change{ tippee.tippee_token }
    end

    it "uses SecureRandom to generate the tippee token" do
      expect(SecureRandom).to receive(:urlsafe_base64)
      tippee.generate_tippee_token
    end
  end

end
