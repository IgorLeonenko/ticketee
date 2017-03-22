require "rails_helper"

RSpec.feature "users can create new project" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New project"
    fill_in :project_name, with: "Sublime text 3"
    fill_in :project_description, with: "Test description"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."
  end
end
