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

	describe "#new" do
		before do
			user2 = create(:user)
			get :new, {recipient_id: user2.id}
		end

		it { should respond_with(200) }
		it { should render_template(:new) }
	end

	describe "#create" do

		context 'with tipper not created' do
			before do
				@user1 = create(:user)
				@user2 = create(:user)
				@tippee = create(:tippee, user_id: @user2.id)
				@tip_params = attributes_for(:tip, tippee_id: @tippee.id, tipper_id: "")
				get :create, {tippee_token: @tippee.tippee_token, tip: @tip_params}
			end

			it { should respond_with(302) }

			it "should redirect to tips#show" do
				tip = Tip.find_by_tippee_id(@tippee.id)
				expect(response).to redirect_to("/tips/#{tip.id}")
			end

			it "creates a new tip with specified params" do
				expect(Tip.count).to eq(1)
			end

			xit "creates a tip with the new tips params associated to the tipper" do
				tip = Tip.last
				expect(@user1.tipper.tips).to include(tip)
			end

			it "creates a tip with the new tip params and is associated with the tippee" do
				tip = Tip.last
				expect(@user2.tippee.tips).to include(tip)
			end

			xit "increased the balance for the intended tippee" do
				expect(@user2.balance).to eq(10.01)
			end

			xit "decreased the balance of the tipper" do

			end
		end

		context 'with both tipper and tippee created' do
			before do
				@user1 = create(:user)
				@user2 = create(:user)
				@tippee = create(:tippee, user_id: @user2.id)
				@tipper = create(:tipper, user_id: @user1.id)
				@tip_params = attributes_for(:tip, tippee_id: @tippee.id, tipper_id: @tipper.id)
				get :create, {tippee_token: @tippee.tippee_token, tip: @tip_params}
			end

			it { should respond_with(302) }

			it "redirects to tips#show" do
				tip = Tip.last
				expect(response).to redirect_to("/tips/#{tip.id}")
			end

			it "creates a new tip" do
				tip = Tip.last
				expect(Tip.count).to eq(1)
			end

			it "creates a new tip with the referring url" do
				tip = Tip.last
				expect(tip.url).to eq("http://www.firstgroup.com/ukbus/assets/images/midlands/test.jpg")
			end

			it "creates a new tip associated with the tipper" do
				tip = Tip.last
				expect(@user1.tipper.tips).to include(tip)
			end

			it "creates a new tip associated with the tippee" do
				tip = Tip.last
				expect(@user2.tippee.tips).to include(tip)
			end
		end
	end

	after do
		Tip.destroy_all
		User.destroy_all
		Tippee.destroy_all
		Tipper.destroy_all
	end

end
