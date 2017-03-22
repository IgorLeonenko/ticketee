require "rails_helper"
RSpec.feature "Users can edit existing projects" do
  before do
    FactoryGirl.create(:project, name: "Sublime Text 3")
    visit "/"
    click_link "Sublime Text 3"
    click_link "Edit project"
  end

  scenario "with valid attributes" do
    fill_in :project_name, with: "Sublime Text 4 beta"
    click_button "Update Project"

    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "Sublime Text 4 beta"
  end

  scenario "with invalid attributes" do
    fill_in :project_name, with: ""
    click_button "Update Project"

    expect(page).to have_content "Project has not been updated."
    expect(page).to have_content "Name can't be blank"
  end
end
