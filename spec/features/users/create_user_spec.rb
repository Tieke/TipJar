require 'rails_helper'

describe "Creating a user account", js: true do
  context "valid credentials" do
    it "successfully creates the new user and logs them in" do
      User.destroy_all

      visit root_path
      expect(page).to have_content("Sign up")

      within ".sign_up" do
        fill_in "full name", with: "Sally"
        fill_in "username", with: "sallysnail"
        fill_in "avatar url", with: "http://test.com"
        fill_in "email", with: "sally@example.com"
        fill_in "password", with: "test1234"
        fill_in "password confirmation", with: "test1234"
        check 'user_terms_version'
        click_button "Sign up"
      end

      expect(page).to have_content("Profile")
      expect(page).to have_content("Sign Out")
    end
  end

  context "invalid credentials" do
    it "displays an error when the username is blank" do
      visit root_path

      within ".sign_up" do
        fill_in "full name", with: "Superman"
        fill_in "username", with: ""
        fill_in "avatar url", with: "http://awesome.com"
        fill_in "email", with: "super@man.com"
        fill_in "password", with: "test1234"
        fill_in "password confirmation", with: "test1234"
        check 'user_terms_version'
        click_button "Sign up"
      end

      expect(page).to_not have_content("Sign Out")
      expect(page).to have_content("Username can't be blank")
    end

    it "displays an error when the email is blank" do
      visit root_path

      within ".sign_up" do
        fill_in "full name", with: "Fred Flintstone"
        fill_in "username", with: "fredflintstone"
        fill_in "avatar url", with: "http://test.com"
        fill_in "email", with: ""
        fill_in "password", with: "test1234"
        fill_in "password confirmation", with: "test1234"
        check 'user_terms_version'
        click_button "Sign up"
      end

      expect(page).to_not have_content("Sign Out")
      expect(page).to have_content("Email can't be blank")
    end

    it "displays an error when the password is blank" do
      visit root_path

      within ".sign_up" do
        fill_in "full name", with: "Daffy Duck"
        fill_in "username", with: "daffyduck"
        fill_in "avatar url", with: "http://test.com"
        fill_in "email", with: "daffyduck@example.com"
        fill_in "password", with: ""
        fill_in "password confirmation", with: "test1234"
        check "user_terms_version"
        click_button "Sign up"
      end

      expect(page).to_not have_content("Sign out")
      expect(page).to have_content("Password can't be blank")
    end
  end
end