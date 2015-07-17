require 'rails_helper'

RSpec.describe Tipper, type: :model do
  describe "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:tips) }
  end
end
