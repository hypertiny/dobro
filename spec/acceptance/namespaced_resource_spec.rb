require 'spec_helper'

describe 'namespaced views' do
  before :each do
    Author.create :name => 'Neil Gaiman'
    Author.create :name => 'Terry Pratchett'
  end

  it "lists the pages" do
    visit admin_authors_path

    page.should have_content('Authors')
    page.should have_content('Neil Gaiman')
    page.should have_content('Terry Pratchett')
  end

  it "creates a new page" do
    visit admin_authors_path

    click_link 'New Author'

    fill_in 'Name', :with => 'Haruki Murakami'
    click_button 'Save Author'

    page.should have_content('Haruki Murakami')
  end

  it "edits an existing page" do
    visit admin_authors_path

    click_link 'Neil Gaiman'
    click_link 'Edit'

    fill_in 'Name', :with => 'China Mieville'
    click_button 'Save Author'

    page.should have_content('China Mieville')
    page.should have_no_content('Neil Gaiman')
  end

  it "deletes pages" do
    visit admin_authors_path

    click_link 'Neil Gaiman'
    click_link 'Delete'
    click_button 'Confirm'

    page.should have_content('Terry Pratchett')
    page.should have_no_content('Neil Gaiman')
  end
end
