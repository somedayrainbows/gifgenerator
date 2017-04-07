require 'rails_helper'

describe "User visits login page" do
  context "as admin" do
    it "they can log in" do
      admin = User.create(first_name: "Jane",
                          last_name: "Doe",
                          email: "happy_admin@gifgenerator.com",
                          password: "ilovegifs123",
                          role: 1)

      visit login_path
      within("form") do
      fill_in "Email", with: "happy_admin@gifgenerator.com"
      fill_in "Password", with: "ilovegifs123"
      click_on "Log in"
    end

      expect(current_path).to eq(user_path(admin))
      expect(page).to have_content("You are now logged in.")
      expect(page).to have_content("Welcome, Jane!")
      expect(page).to have_content("Log out")
    end
  end

  context "as default user" do
    it "they can log in" do
      user = User.create(first_name: "Helga",
                         last_name: "Richards",
                         email: "helga@gmail.com",
                         password: "icecream",
                         role: 0)

      visit login_path
      within("form") do
      fill_in "Email", with: "helga@gmail.com"
      fill_in "Password", with: "icecream"
      click_on "Log in"
    end

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("You are now logged in.")
      expect(page).to have_content("Welcome, Helga!")
      expect(page).to have_content("Log out")
    end
  end
end
