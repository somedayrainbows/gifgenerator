require 'rails_helper'

describe "User visits login page" do
  context "as admin" do
    it "they get an error when entering the wrong login email" do
      admin = User.create(first_name: "Jane",
                          last_name: "Doe",
                          email: "happy_admin@gifgenerator.com",
                          password: "ilovegifs123",
                          role: 1)
      visit login_path
      within("form") do
      fill_in "Email", with: "admin@gifgenerator.com"
      fill_in "Password", with: "ilovegifs123"
      click_on "Log in"
    end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid email/password combination.")
    end
  end

  context "as default user" do
    it "they get an error when entering the wrong login password" do
      user = User.create(first_name: "Helga",
                         last_name: "Richards",
                         email: "helga@gmail.com",
                         password: "icecream")
      visit login_path
      within("form") do
      fill_in "Email", with: "helga@gmail.com"
      fill_in "Password", with: "hello"
      click_on "Log in"
    end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid email/password combination.")
    end
  end
end
