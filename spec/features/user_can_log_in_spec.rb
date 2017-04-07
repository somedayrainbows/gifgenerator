require 'rails_helper'

describe "User visits login page" do
  context "as admin" do
    xit "they can log in" do
      admin = User.create(first_name: "Jane",
                          last_name: "Doe",
                          email: "happy_admin@gifgenerator.com",
                          password: "ilovegifs123",
                          role: 1)

      visit login_path
      within("form") do
        fill_in "email", with: admin.email
        fill_in "password", with: admin.password
        click_on "Login"
      end

      expect(current_path).to eq(user_path(admin))
      expect(page).to have_content("You are now logged in.")
      expect(page).to have_content("Welcome, Jane!")
      expect(page).to have_content("Logout")
    end
  end

  context "as default user" do
    xit "they can log in" do
      user = User.create(first_name: "Helga",
                         last_name: "Richards",
                         email: "helga@gmail.com",
                         password: "icecream",
                         role: 0)

      visit login_path
      within("form") do
        fill_in "email", with: user.email
        fill_in "password", with: user.password
        click_on "Login"
      end

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("You are now logged in.")
      expect(page).to have_content("Welcome, Helga!")
      expect(page).to have_content("Logout")
      end
    end
end
