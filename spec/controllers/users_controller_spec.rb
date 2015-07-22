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
			Follow.create(followed_id: @user2.id, following_id: @user.id)
		end

		it "reduces the number of follows by one" do
			expect{get :unfollow, user_id: @user2.id}.to change{Follow.count}.by(-1)
		end

		it "returns http status 200" do
			get :unfollow, user_id: @user2.id
			expect(response).to have_http_status(200)
		end
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

	describe "following" do
		before do
			@user2 = create(:user)
			get :follow, user_id: @user2.id
			get :following, user_id: @user.id
		end

		it { should respond_with(200) }

		it "returns a list of followings for the specified user" do
			expect(response.body).to eq(@user.following_follows.to_json)
		end
	end


	describe "stats" do
		context 'no tips given or received' do
			before do
				@user = create(:user)
				get :stats, user_id: @user.id
			end

			it { should respond_with(200) }

			it "should assign specified user to @user" do
				expect(assigns(:user)).to eq(@user)
			end

			it "returns a hash with zero tips given and received for the specified user" do
				expect(response.body).to eq({"num_of_tips_given":0,"num_of_tips_recieved":0}.to_json)
			end
		end

		context 'tips given no tips received' do
			before do
				@tipper = create(:tipper)
				@user = @tipper.user
				10.times { create( :tip, tipper_id: @tipper.id ) }
				get :stats, user_id: @user.id
			end

			it { should respond_with(200) }

			it "should assign specified user to @user" do
				expect(assigns(:user)).to eq(@user)
			end

			it "returns a hash with 10 tips given and zero received for the specified user" do
				expect(response.body).to eq({"num_of_tips_given":10,"num_of_tips_recieved":0}.to_json)
			end
		end

		context 'no tips given 10 tips received' do
			before do
				@tippee = create(:tippee)
				@user = @tippee.user
				10.times { create( :tip, tippee_id: @tippee.id ) }
				get :stats, user_id: @user.id
			end

			it { should respond_with(200) }

			it "should assign specified user to @user" do
				expect(assigns(:user)).to eq(@user)
			end

			it "returns a hash with 10 tips given and zero received for the specified user" do
				expect(response.body).to eq({"num_of_tips_given":0,"num_of_tips_recieved":10}.to_json)
			end
		end


		context '10 tips given 10 tips received' do
			before do
				@tippee = create(:tippee)
				@user = @tippee.user
				@tipper = create(:tipper, user_id: @user.id)
				10.times { create( :tip, tippee_id: @tippee.id, tipper_id: @tipper.id ) }
				get :stats, user_id: @user.id
			end

			it { should respond_with(200) }

			it "should assign specified user to @user" do
				expect(assigns(:user)).to eq(@user)
			end

			it "returns a hash with 10 tips given and zero received for the specified user" do
				expect(response.body).to eq({"num_of_tips_given":10,"num_of_tips_recieved":10}.to_json)
			end
		end

	end

	after do
		User.destroy_all
		Follow.destroy_all
		Deposit.destroy_all
		Withdrawal.destroy_all
	end

end
