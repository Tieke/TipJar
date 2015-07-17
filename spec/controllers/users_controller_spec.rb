require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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

end
