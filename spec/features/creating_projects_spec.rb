require "rails_helper"

RSpec.feature "users can create new project" do
  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit "/"
    click_link "New Project"
  end

  scenario "with valid attributes" do
    fill_in :project_name, with: "Sublime text 3"
    fill_in :project_description, with: "Test description"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."

    project = Project.find_by(name: "Sublime text 3")
    expect(page.current_url).to eq project_url(project)

    title = "Sublime text 3 - Projects - Ticketee"
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do
    click_button "Create Project"

    expect(page).to have_content "Project has not been created."
    expect(page).to have_content "Name can't be blank"
  end
end
