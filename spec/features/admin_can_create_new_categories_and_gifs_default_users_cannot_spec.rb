require 'rails_helper'

RSpec.feature "Admin visits gif new page" do
  context "as admin" do
    it "allows admin to add a new category and gif at the same time" do
      admin = User.create(first_name: "Jane",
                          last_name: "Doe",
                          email: "happy_admin@gifgenerator.com",
                          password: "ilovegifs123"
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_gifs_path
      expect(page).to have_content("Create a New Category and Gif")
      click_on "add gif and create category"
      expect(current_page).to eq(admin_categories_gifs)
    end
  end


end

# when an admin enters a single search term
# a category is created with that term
# and a gif is generated with that term
# and appears on the gif index page
# and users cannot access the category/gif generation form
