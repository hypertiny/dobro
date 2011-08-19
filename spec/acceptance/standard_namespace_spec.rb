require 'spec_helper'

describe 'standard setup', :driver => :rack_test do
  before :each do
    Page.create :name => 'About Us', :content => 'All you need to know'
    Page.create :name => 'FAQ',      :content => 'All you need to ask'
  end

  it "lists the pages" do
    visit dobro.pages_path

    page.should have_content('Pages')
    page.should have_content('About Us')
    page.should have_content('FAQ')
  end

  it "creates a new page" do
    visit dobro.pages_path

    click_link 'New Page'

    fill_in 'Name',    :with => 'Contact Us'
    fill_in 'Content', :with => 'A phone number or some such'
    click_button 'Save Page'

    page.should have_content('Contact Us')
  end

  it "edits an existing page" do
    visit dobro.pages_path

    click_link 'FAQ'
    click_link 'Edit'

    fill_in 'Name', :with => 'Common Questions'
    click_button 'Save Page'

    page.should have_content('Common Questions')
  end

  it "deletes pages" do
    visit dobro.pages_path

    click_link 'FAQ'
    click_link 'Delete'
    click_button 'Confirm'

    page.should have_content('About Us')
    page.should have_no_content('FAQ')
  end
end
