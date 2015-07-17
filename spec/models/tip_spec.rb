require 'rails_helper'

RSpec.describe Tip, type: :model do
  describe "validation" do
    let!(:tip){create(:tip)}
    it "has an URL" do
      expect(tip).to validate_presence_of(:url)
    end

    it "has an amount" do
      expect(tip).to validate_presence_of(:amount)
    end
  end
end
