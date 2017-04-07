require 'rails_helper'

describe "Admin visits gif new page" do
  context "as admin" do
    xit "allows admin to add a new category and gif at the same time" do
      admin = User.create(first_name: "Jane",
                          last_name: "Doe",
                          email: "happy_admin@gifgenerator.com",
                          password: "ilovegifs123",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path
      expect(page).to have_content("Create a New Category and Gif")
      fill_in "category", with: "goats"
      click_on "add gif and create category"
      expect(current_page).to eq(admin_category_gifs_path)
      expect(page).to have_content("goats")
      expect(page).to have_content("Admin Gifs by Category")
    end

    context "as default user" do
      xit "does not allow default user to add a new category and gif" do
        user = User.create(first_name: "Helga",
                           last_name: "Richards",
                           email: "helga@gmail.com",
                           password: "icecream",
                           role: 0)
      visit new_admin_category_gif_path
      expect(page).to_not have_content("Admin Gifs by Category")
      expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end
  end


end

# when an admin enters a single search term
# a category is created with that term
# and a gif is generated with that term
# and appears on the gif index page
# and users cannot access the category/gif generation form
