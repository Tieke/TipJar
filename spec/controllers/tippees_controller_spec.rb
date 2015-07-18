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
        get :token, user_id: @user.id
      end

      it "should have a successful http status" do
        expect(response).to have_http_status(:success)
      end

      it "should render the token template" do
        expect(response).to render_template(:token)
      end
    end

    context "without a tippee token" do
      before do
        get :token, user_id: @user.id
      end

      it "should have a successful http status" do
        expect(response).to have_http_status(:success)
      end

      it "should render the new template" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "#new" do
    before do
      get :new
    end

    it "should have a successful http status"  do
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      expect(response).to render_template(:new)
    end
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

    it "redirects to the token screen" do
      expect(response).to redirect_to(display_token_path(@user))
    end

  end
end