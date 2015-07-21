require 'rails_helper'

describe "Creating a user account", js: true do
  context "valid credentials" do
    it "successfully creates the new user" do
      visit root_path
      expect(page).to have_content("Sign up")

      within ".sign_up" do
        fill_in "full name", with: "Bugs Bunny"
        fill_in "username", with: "bunny"
        fill_in "avatar url", with: "http://www.test.com"
        fill_in "email", with: "bugsbunny@email.com"
        fill_in "password", with: "test1234"
        fill_in "password confirmation", with: "test1234"
        check 'user_terms_version'
        click_button "Sign up"
      end

      expect(page).to have_content("Profile")
      expect(page).to have_content("Sign Out")
    end
  end

  after do
    User.destroy_all
  end
end