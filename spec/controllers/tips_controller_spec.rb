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

	describe "#show" do
		before do
				@tip = create(:tip)
				get :show, id: @tip.id
		end

		it { should respond_with(200) }

		it "should return specified tip in last response body, as json" do
			expect(response.body).to eq(@tip.to_json)
		end 

		it "should assign specified tip to @tip" do
			expect(assigns(:tip)).to eq(@tip)
		end
	end

	describe "given" do
		before do
			10.times { create(:tip) }
			get :index
			
		end
	end



end
