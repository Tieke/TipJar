require "rails_helper"

RSpec.describe TippeesController, type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user)
    sign_in @user
  end

  describe "#create" do

    it "creates a new tippee" do
      expect { post :create, user_id: @user.id }.to change{ Tippee.count }.by(1)
    end

    before do
      post :create, user_id: @user.id
    end

    it "should return a redirect" do
      expect(response).to be_redirect
    end

    it "redirects to the tip settings screen" do
      expect(response).to redirect_to(tip_settings_path(@user))
    end
  end
end