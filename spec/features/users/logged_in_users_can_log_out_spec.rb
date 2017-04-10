require 'rails_helper'

describe "Logged in user can logout" do
  it "they are successfully logged out" do
    user = User.create(first_name: "Helga",
                       last_name: "Richards",
                       email: "helga@gmail.com",
                       password: "icecream")

    visit login_path
    within("form") do
      fill_in "Email", with: "helga@gmail.com"
      fill_in "Password", with: "icecream"
      click_on "Log in"
    end

    expect(current_path).to eq(user_path(user))
    click_on "Log out"

    expect(page).to have_content("You have logged out successfully.")
    expect(current_path).to eq(login_path)
  end
end
