require "rails_helper"

RSpec.feature "users can create new project" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New project"
    fill_in :project_name, with: "Sublime text 3"
    fill_in :project_description, with: "Test description"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."

    project = Project.find_by(name: "Sublime text 3")
    expect(page.current_url).to eq project_url(project)

    title = "Sublime text 3 - Projects - Ticketee"
    expect(page).to have_title title
  end
end
