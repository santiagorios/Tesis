# encoding: utf-8
require 'spec_helper'

describe "Manage Programs" do
  def login
    user = FactoryGirl.create(:user)
    user.activate!
    visit root_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "secret"
    click_button "Log in"
    user
  end
  it 'creates a program' do
    login
    program_type = FactoryGirl.create(:program_type)
    program = FactoryGirl.build(:program)
    visit new_program_path
    fill_in "Title", :with => program.title
    fill_in "Description", :with => program.description
    select program_type.name, :from => 'Program type'
    click_button "Create Program"
    page.should have_content(program.title)
    page.should have_content(program.description)
  end

  it 'edits a program' do
    current_user = login
    program = FactoryGirl.create(:program)
    program.user = current_user
    program.save
    visit edit_program_path(program)
    fill_in "Title", :with => "New title"
    click_button "Update Program"
    page.should have_content("New title")
    page.should have_content(program.description)
  end

  it 'deletes a program' do
    current_user = login
    program = FactoryGirl.create(:program)
    program.user = current_user
    program.save
    visit program_path(program)
    click_link "Destroy"
    page.should have_content("There's nothing here yet")
  end

  it 'displays a program as a logged in user' do
    current_user = login
    program = FactoryGirl.create(:program)
    program.user = current_user
    program.save
    visit program_path(program)
    page.should have_content(program.title)
  end

  # Anonymous tests
  it 'displays a program as an anonymous user' do
    program = FactoryGirl.create(:program)
    user = FactoryGirl.create(:user)
    program.user = user
    program.save
    visit program_path(program)
    page.should have_content(program.title)
  end

  it 'displays an error message when trying to create a program as an anonymous user' do
    visit new_program_path
    page.should have_content("Please sign in")
  end

  it 'displays an error message when trying to edit a program as an anonymous user' do
    program = FactoryGirl.create(:program)
    program.user = FactoryGirl.create(:user)
    program.save
    visit edit_program_path(program)
    page.should have_content("Please sign in")
  end
end
