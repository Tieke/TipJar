require 'rails_helper'

RSpec.describe TipsController, type: :controller do

	before do
		@request.env["devise.mapping"] = Devise.mappings[:user]
		@user = create(:user)
		sign_in @user
	end

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

	describe "#given" do
		before do
			@tipper = create(:tipper)
			@user = @tipper.user
			# @tippee = create(:tippee)
			10.times { create( :tip, tipper_id: @tipper.id ) }
			get :given, user_id: @user.id
		end

		it { should respond_with(200) }

		it "should return all the tips given out by a specified user as json" do
			expect(response.body).to eq(@user.tipper.tips.to_json)
		end

		it "should assign all the given tips to @tips_given" do
			expect(assigns(:tips_given)).to eq(@user.tipper.tips)
		end

	end

	describe "#received" do
		before do
			@tippee = create(:tippee)
			@user = @tippee.user
			# @tippee = create(:tippee)
			10.times { create( :tip, tippee_id: @tippee.id ) }
			get :received, user_id: @user.id
		end

		it { should respond_with(200) }

		it "should return all the tips received out by a specified user as json" do
			expect(response.body).to eq(@user.tippee.tips.to_json)
		end

		it "should assign all the received tips to @tips_received" do
			expect(assigns(:tips_received)).to eq(@user.tippee.tips)
		end

	end

	describe "#new_widget" do
		before do
			tippee = create(:tippee)
			get :new_widget, {tippee_token: tippee.tippee_token}
		end

		it { should respond_with(200) }
		it { should render_template(:new_widget) }
	end

	describe '#create_from_widget' do
		context "if valid params" do

			before do
				@tippee = create(:tippee)
				@tip_params = attributes_for(:tip, tippee_id: @tippee.id)
				post :create_from_widget, { tippee_token: @tippee.tippee_token, tip: @tip_params }
			end

			it { should respond_with(302) }

			it "should redirect to tips#show" do
				tip = Tip.find_by(@tip_params)
				expect(response).to redirect_to("/tips/#{tip.id}")
			end

			it "creates a new tip with specified params" do
				expect(Tip.find_by(@valid_params)).to be_truthy
			end

			it "creates a tip with the new tips params associated to the tipper" do
				tip = Tip.find_by(@tip_params)
				expect(@user.tipper.tips).to include(tip)
			end

			it "creates a tip with the new tip params and is associated with the tippee" do
				tip = Tip.find_by(@tip_params)
				expect(@tippee.tips).to include(tip)
			end

			it "increased the balance for the intended tippee" do

			end

			it "decreased the balance of the tipper" do

			end

		end

		context "if invalid params" do

			before do
				@tippee = create(:tippee)
				@invalid_tip_params = attributes_for(:tip, amount: 0, tippee_id: @tippee.id)
				post :create_from_widget, { tippee_token: @tippee.tippee_token, tip: @invalid_tip_params }
			end

			it { should respond_with(400) }

			it {should render_template(:new_widget) }

			it "doesn't create a new tip with specified params" do
				expect(Tip.find_by(@valid_params)).to be_falsey
			end

			it "doesn't create a tip with the new tips params associated to the tipper" do
				tip = Tip.find_by(@tip_params)
				expect(@user.tipper.tips).to_not include(tip)
			end

			it "doesn't create a tip with the new tip params and is associated with the tippee" do
				tip = Tip.find_by(@tip_params)
				expect(@tippee.tips).to_not include(tip)
			end

		end
	end





end
