# encoding: utf-8
require 'spec_helper'

describe "Manage Results" do
  def login
    user = FactoryGirl.create(:user)
    user.activate!
    visit root_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "secret"
    click_button "Log in"
    user
  end
  it 'creates a result' do
    current_user = login
    result_type = FactoryGirl.create(:result_type)
    project = FactoryGirl.create(:project)
    project.user = current_user
    project.save
    result = FactoryGirl.build(:result)
    visit new_result_path
    find('#result_title').set(result.title)
    fill_in "Description", :with => result.description
    select result_type.name, :from => 'Result type'
    select project.title, :from => 'Project'
    click_button "Create Result"
    page.should have_content(result.title)
    page.should have_content(result.description)
  end

  it 'edits a result' do
    current_user = login
    project = FactoryGirl.create(:project)
    project.user = current_user
    project.save
    result = FactoryGirl.create(:result)
    result.user = current_user
    result.save
    visit edit_result_path(result)
    find('#result_title').set("New title")
    select project.title, :from => 'Project'
    click_button "Update Result"
    page.should have_content("New title")
    page.should have_content(result.description)
  end

  it 'deletes a result' do
    current_user = login
    result = FactoryGirl.create(:result)
    result.user = current_user
    result.save
    visit result_path(result)
    click_link "Destroy"
    page.should have_content("There's nothing here yet")
  end

  it 'displays a result as a logged in user' do
    current_user = login
    result = FactoryGirl.create(:result)
    result.user = current_user
    result.save
    visit result_path(result)
    page.should have_content(result.title)
  end

  # Anonymous tests
  it 'displays a result as an anonymous user' do
    result = FactoryGirl.create(:result)
    user = FactoryGirl.create(:user)
    result.user = user
    result.save
    visit result_path(result)
    page.should have_content(result.title)
  end

  it 'displays an error message when trying to create a result as an anonymous user' do
    visit new_result_path
    page.should have_content("Please sign in")
  end

  it 'displays an error message when trying to edit a result as an anonymous user' do
    result = FactoryGirl.create(:result)
    result.user = FactoryGirl.create(:user)
    result.save
    visit edit_result_path(result)
    page.should have_content("Please sign in")
  end
end
