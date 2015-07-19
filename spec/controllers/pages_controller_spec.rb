require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "page" do

    before do
      get :page
    end

    it { should respond_with(200) }

    it { should render_template(:page) }
  end

end
