require "rails_helper"

RSpec.describe TippeesController, type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user)
    sign_in @user
  end

  describe "#token" do
    context "with tippee token" do
      let!(:tippee) {create(:tippee, user_id: @user.id)} 

      before do
        get :token
      end

      it "should have a successful http status" do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "#new" do
    before do
      get :new
    end
    it "should have successful http status"  do
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end

end