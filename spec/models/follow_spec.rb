require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe "relationships" do
    it { should belong_to(:following) }
    it { should belong_to(:followed) }
  end
end
