require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	before do
		@request.env["devise.mapping"] = Devise.mappings[:user]
		@user = create(:user)
		sign_in @user
	end

	describe "#index" do
		before do
			5.times { create(:user) }
			get :index
		end

		it { should respond_with(200) }

		it "should expect the body of the last response to be all the users as json" do
			expect(response.body).to eq(User.all.to_json)
		end

		it "should assign @users to all Users in the DB" do
			expect(assigns(:users)).to eq(User.all)
		end
	end

	describe "#show" do
		before do
				@user = create(:user)
				get :show, id: @user.id
		end

		it { should respond_with(200) }

		it "should return specified user in last response body, as json" do
			expect(response.body).to eq(@user.to_json)
		end

		it "should assign specified user to @user" do
			expect(assigns(:user)).to eq(@user)
		end
	end

	describe '#transactions' do

		context 'withdrawal' do
			before do
				@user = create(:user)
				create(:withdrawal, user_id: @user.id)
				get :transactions, user_id: @user.id
			end

			it { should respond_with(200) }

			it 'should return a users withdrawals as json' do
				expect(response.body).to eq({"withdrawals" => @user.withdrawals, "deposits" => @user.deposits}.to_json)
			end
		end

		context 'deposit' do
			before do
				@user = create(:user)
				create(:deposit, user_id: @user.id)
				get :transactions, user_id: @user.id
			end

			it { should respond_with(200) }

			it 'should return a users deposits as json' do
				expect(response.body).to eq({"withdrawals" => @user.withdrawals, "deposits" => @user.deposits}.to_json)
			end
		end

		context 'withdrawal and deposit' do
			before do
				@user = create(:user)
				create(:deposit, user_id: @user.id)
				create(:withdrawal, user_id: @user.id)
				get :transactions, user_id: @user.id
			end

			it { should respond_with(200) }

			it 'should return a users deposits and withdrawals, as json' do
				expect(response.body).to eq({"withdrawals" => @user.withdrawals, "deposits" => @user.deposits}.to_json)
			end
		end

	end

	describe 'follow' do

		before do
			@user2 = create(:user)
		end

		it "increases the number of follows by one" do
			expect{get :follow, user_id: @user2.id}.to change{Follow.count}.by(1)
		end

		before do
			get :follow, user_id: @user2.id
		end

		it { should respond_with(200) }
	end

	describe 'unfollow' do
		before do
			@user2 = create(:user)
			get :follow, user_id: @user2.id
		end

		it "reduces the number of follows by one" do
			expect{get :unfollow, user_id: @user2.id}.to change{Follow.count}.by(-1)
		end

		before do
			get :unfollow, user_id: @user2.id
		end

		it { should respond_with(200) }
	end

	describe "followers" do
		before do
			@user2 = create(:user)
			get :follow, user_id: @user2.id
			get :followers, user_id: @user.id
		end

		it { should respond_with(200) }

		it "returns a list of followers for the specified user" do
			expect(response.body).to eq(@user.followed_follows.to_json)
		end

	end


	# xdescribe '#edit' do
	# 	before do
	# 		@user = create(:user)
	# 		get :edit, id:  @user.id
	# 	end

	# 	it { should respond_with(200) }
	# 	it { should render_template(:edit) }
	# 	it "should assign user with specified id to @user" do
	# 		expect(assigns(:user)).to eq(@user)
	# 	end
	# end

	# xdescribe '#update' do

	# 	context 'valid params' do
	# 		before do
	# 			@user = create(:user)
	# 			@user_params = attributes_for(:user)
	# 			patch :update, { id: @user.id, user: @user_params}
	# 		end

	# 		it { should respond_with(302)}
	# 		it { should redirect_to("/users/#{@user.id}") }
	# 		it "should udpate the attributes for user" do
	# 			expect(User.find_by(@user_params)).to be_truthy
	# 		end
	# 	end

	# 	context 'invalid params' do
	# 		before do
	# 			@user = create(:user)
	# 			@invalid_user_params = { username: "", email: true }
	# 			patch :update, { id: @user.id, user: @invalid_user_params}
	# 		end

	# 		it { should respond_with(400)}
	# 		it { should redirect_to(":edit") }
	# 		it "should NOT update the attributes for user" do
	# 			expect(User.find_by(@invalid_user_params)).to be_nil
	# 		end
	# 	end
	# end

	# xdescribe "#new" do
	# 	before do
	# 		get :new
	# 	end

	# 	it { should respond_with(200) }
	# 	it {should render_template(:new) }
	# end

	# xdescribe '#create' do

	# 	context "if valid params" do
	# 		before do
	# 			@user_params = attributes_for(:user)
	# 			post :create, { user: @user_params }
	# 		end

	# 		it { should respond_with(302) }

	# 		it "should redirect to the pages home page" do
	# 			user = User.find_by(@user_params)
	# 			expect(response).to redirect_to("/")
	# 		end

	# 		it "creates a new user with specified params" do
	# 			expect(User.find_by(@valid_params)).to be_truthy
	# 		end

	# 	end
	# end

	after do
		User.destroy_all
		Follow.destroy_all
		Deposit.destroy_all
		Withdrawal.destroy_all
	end

end
