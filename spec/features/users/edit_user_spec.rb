require 'rails_helper'

describe "Editing a user account", js: true do
  context "with valid credentials" do
    it "updates the users profile" do
      User.create(full_name: "Sarah", username: "sarahsmith", image_url: "http://test.com", email: "sarah@example.com", password: "test1234", password_confirmation: "test1234")

      visit '/'

      within ".sign_in" do
        fill_in "email", with: "sarah@example.com"
        fill_in "password", with: "test1234"
        click_button "Sign in"
      end

      expect(page).to have_content("Profile")
      visit '/users/edit'
      expect(page).to have_content("Edit User")

      fill_in "about", with: "The rain in Spain falls mainly on the plains."
      fill_in "current password", with: "test1234"
      click_button "Update"

      expect(page).to_not have_content("Edit User")
    end
  end

  context "with invalid credentials" do
    it "doesn't update the users profile when the current password is blank" do
      User.create(full_name: "Wilma Flintstone", username: "wilmaflinstone", image_url: "http://test.com", email: "wilma@example.com", password: "test1234", password_confirmation: "test1234")

      visit '/'

      within ".sign_in" do
        fill_in "email", with: "wilma@example.com"
        fill_in "password", with: "test1234"
        click_button "Sign in"
      end

      expect(page).to have_content("Profile")
      visit '/users/edit'
      expect(page).to have_content("Edit User")
      fill_in "username", with: ""
      fill_in "current password", with: ""
      click_button "Update"

      expect(page).to have_content("Current password can't be blank")
    end
  end

  context "when user is not logged in" do
    it "displays an error message to the user" do
      visit '/users/edit'

      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end
end