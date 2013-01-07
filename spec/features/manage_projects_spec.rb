# encoding: utf-8
require 'spec_helper'

describe "Manage Projects" do
  def login
    user = FactoryGirl.create(:user)
    user.activate!
    visit root_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "secret"
    click_button "Log in"
    user
  end
  it 'creates a project' do
    current_user = login
    program = FactoryGirl.create(:program)
    program.user = current_user
    program.save
    project = FactoryGirl.build(:project)
    visit new_project_path
    fill_in "Title", :with => project.title
    fill_in "Description", :with => project.description
    select program.title, :from => 'Program'
    click_button "Create Project"
    page.should have_content(project.title)
    page.should have_content(project.description)
  end

  it 'edits a project' do
    current_user = login
    program = FactoryGirl.create(:program)
    program.user = current_user
    program.save
    project = FactoryGirl.create(:project)
    project.user = current_user
    project.save
    visit edit_project_path(project)
    fill_in "Title", :with => "New title"
    select program.title, :from => 'Program'
    click_button "Update Project"
    page.should have_content("New title")
    page.should have_content(project.description)
  end

  it 'deletes a project' do
    current_user = login
    project = FactoryGirl.create(:project)
    project.user = current_user
    project.save
    visit project_path(project)
    click_link "Destroy"
    page.should have_content("There's nothing here yet")
  end

  it 'displays a project as a logged in user' do
    current_user = login
    project = FactoryGirl.create(:project)
    project.user = current_user
    project.save
    visit project_path(project)
    page.should have_content(project.title)
  end

  # Anonymous tests
  it 'displays a project as an anonymous user' do
    project = FactoryGirl.create(:project)
    user = FactoryGirl.create(:user)
    project.user = user
    project.save
    visit project_path(project)
    page.should have_content(project.title)
  end

  it 'displays an error message when trying to create a project as an anonymous user' do
    visit new_project_path
    page.should have_content("Please sign in")
  end

  it 'displays an error message when trying to edit a project as an anonymous user' do
    project = FactoryGirl.create(:project)
    project.user = FactoryGirl.create(:user)
    project.save
    visit edit_project_path(project)
    page.should have_content("Please sign in")
  end
end
