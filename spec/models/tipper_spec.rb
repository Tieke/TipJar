require 'rails_helper'

RSpec.describe Tipper, type: :model do
  let!(:tipper) { create(:tipper) }
  describe "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:tips) }
  end

  describe "validations" do
    it "has standard_tip_amount" do
      expect(tipper).to validate_presence_of(:standard_tip_amount)
    end
  end

  describe "#update_standard_tip_amount" do
    it "updates the tip amount by the specified value" do
      tipper.update_standard_tip_amount(0.05)
      expect(tipper.standard_tip_amount).to eq(0.05)
    end
  end

end
