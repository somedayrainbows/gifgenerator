require 'rails_helper'

describe "Admin visits the page to create a new category and gif" do
  context "as admin" do
    it "allows admin to add a new category and gif at the same time" do
      admin = User.create(first_name: "Jane",
                          last_name: "Doe",
                          email: "happy_admin@gifgenerator.com",
                          password: "ilovegifs123",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path
      expect(page).to have_content("Create a New Category and Gif")

      fill_in "category[name]", with: "goats"
      # save_and_open_page
      click_on "Add category and create gif"

      expect(current_path).to eq(category_path(Category.last))
      expect(Category.last.name).to eq("goats")
      # expect(page).to have_content("goats")
    end

    # context "as default user" do
    #   it "does not allow default user to add a new category and gif" do
    #     user = User.create(first_name: "Helga",
    #                        last_name: "Richards",
    #                        email: "helga@gmail.com",
    #                        password: "icecream")
    #
    #   visit new_admin_category_path
    #   save_and_open_page
    #   expect(page).to have_content("The page you were looking for doesn't exist")
    #   end
    # end
  end


end

# when an admin enters a single search term
# a category is created with that term
# and a gif is generated with that term
# and appears on the gif index page
# and users cannot access the category/gif generation form
