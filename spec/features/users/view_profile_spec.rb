require 'rails_helper'

describe "Viewing a users profile", js: true do
  context "User is not logged in" do
    it "requires a user to be logged in" do
      visit '/'
      expect(page).to_not have_content("Profile")
    end
  end

  context "User is logged in" do
    it "lets a user view their profile" do
      User.create(full_name: "Lily Claire", username: "lilyclaire", email: "lily@example.com", password: "test1234", password_confirmation: "test1234")
      visit '/'

      within '.sign_in' do
        fill_in "email", with: "lily@example.com"
        fill_in "password", with: "test1234"
        click_button "Sign in"
      end

      expect(page).to have_content("Profile")
      click_link("Profile")
      expect(page).to have_content("Lily Claire")
    end
  end
end