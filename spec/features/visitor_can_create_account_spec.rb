require 'rails_helper'

describe "User visits the new user page" do
  it "they can create a new user" do
    visit new_user_path
    expect(page).to have_content("Create a New Account")
    fill_in "user[first_name]", with: "Jane"
    fill_in "user[last_name]", with: "Doe"
    fill_in "user[email]", with: "happy_admin@gifgenerator.com"
    fill_in "user[password]", with: "ilovegifs123"
    fill_in "user[password_confirmation]", with: "ilovegifs123"
    click_on "Create User"
    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("You are now logged in.")
    expect(User.last.role).to eq("default")
    expect(page).to have_content("Welcome, Jane!")
  end
end
