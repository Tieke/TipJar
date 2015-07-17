require 'rails_helper'

RSpec.describe TipsController, type: :controller do

	describe "#index" do
		before do
			10.times { create(:tip) }
			get :index
		end

		it { should respond_with(200) }

		it "should expect the body of the last response to be all the tips as json" do
			expect(response.body).to eq(Tip.all.to_json)
		end

		it "should assign @tips to all tips in the DB" do
			expect(assigns(:tips)).to eq(Tip.all)
		end
	end



end
