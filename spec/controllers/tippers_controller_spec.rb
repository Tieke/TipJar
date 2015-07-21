require "rails_helper"

RSpec.describe TippersController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user)
    sign_in @user
  end

  describe "#update" do
    let!(:tipper) { create(:tipper, user_id: @user.id) }

    before do
      patch :update, id: tipper.id, standard_tip_amount: 0.05
    end

    it "should return a redirect" do
      expect(response).to be_redirect
    end

    it "redirects to the token screen" do
      expect(response).to redirect_to(tip_settings_path(@user))
    end
  end
end
