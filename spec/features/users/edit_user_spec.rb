require 'rails_helper'

describe "Editing a user account", js: true do
  context "with valid credentials" do
    it "updates the users profile" do
      visit '/'

      within ".sign_up" do
        fill_in "full name", with: "Sarah"
        fill_in "username", with: "sarahsmith"
        fill_in "avatar url", with: "http://test.com"
        fill_in "email", with: "sarah@example.com"
        fill_in "password", with: "test1234"
        fill_in "password confirmation", with: "test1234"
        check 'user_terms_version'
        click_button "Sign up"
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
      visit '/'

      within ".sign_up" do
        fill_in "full name", with: "Wilma Flintstone"
        fill_in "username", with: "wilmaflinstone"
        fill_in "avatar url", with: "http://test.com"
        fill_in "email", with: "wilma@example.com"
        fill_in "password", with: "test1234"
        fill_in "password confirmation", with: "test1234"
        check "user_terms_version"
        click_button "Sign up"
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
end