# encoding: utf-8
require 'spec_helper'

describe "Manage Entries" do
  def login
    user = FactoryGirl.create(:user)
    user.activate!
    visit root_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "secret"
    click_button "Log in"
    user
  end
  it 'creates a entry' do
    current_user = login
    program = FactoryGirl.create(:program)
    program.user = current_user
    program.save
    entry = FactoryGirl.build(:entry)
    visit new_entry_path
    find('#entry_title').set(entry.title)
    fill_in "Body", :with => entry.body
    select program.title, :from => 'Program'
    click_button "Create Entry"
    page.should have_content(entry.title)
    page.should have_content(entry.body)
  end

  it 'edits a entry' do
    current_user = login
    program = FactoryGirl.create(:program)
    program.user = current_user
    program.save
    entry = FactoryGirl.create(:entry)
    entry.user = current_user
    entry.save
    visit edit_entry_path(entry)
    find('#entry_title').set("New title")
    select program.title, :from => 'Program'
    click_button "Update Entry"
    page.should have_content("New title")
    page.should have_content(entry.body)
  end

  it 'deletes a entry' do
    current_user = login
    entry = FactoryGirl.create(:entry)
    entry.user = current_user
    entry.save
    visit entry_path(entry)
    click_link "Destroy"
    page.should have_content("There's nothing here yet")
  end

  it 'displays a result as a logged in user' do
    current_user = login
    entry = FactoryGirl.create(:entry)
    entry.user = current_user
    entry.save
    visit entry_path(entry)
    page.should have_content(entry.title)
  end

  # Anonymous tests
  it 'displays an entry as an anonymous user' do
    entry = FactoryGirl.create(:entry)
    user = FactoryGirl.create(:user)
    entry.user = user
    entry.published = true
    entry.save
    visit entry_path(entry)
    page.should have_content(entry.title)
  end

  it 'displays an error message when trying to create an entry as an anonymous user' do
    visit new_entry_path
    page.should have_content("Please sign in")
  end

  it 'displays an error message when trying to edit an entry as an anonymous user' do
    entry = FactoryGirl.create(:entry)
    entry.user = FactoryGirl.create(:user)
    entry.save
    visit edit_entry_path(entry)
    page.should have_content("Please sign in")
  end
end
