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

	describe '#purchase' do
		context 'valid params' do
			before do
				@user = create(:user)
			end



		end
	end

end






