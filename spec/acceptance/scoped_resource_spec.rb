require 'spec_helper'

describe 'scoped views' do
  before :each do
    Link.create :title => 'XKCD',        :url => 'http://xkcd.com'
    Link.create :title => 'Big Picture', :url => 'http://boston.com/bigpicture/'
  end

  it "lists the pages" do
    visit my_links_path

    page.should have_content('Links')
    page.should have_content('XKCD')
    page.should have_content('Big Picture')
  end

  it "creates a new page" do
    visit my_links_path

    click_link 'New Link'

    fill_in 'Title', :with => 'Github'
    fill_in 'Url',   :with => 'http://github.com'
    click_button 'Save Link'

    page.should have_content('Github')
  end

  it "edits an existing page" do
    visit my_links_path

    click_link 'Big Picture'
    click_link 'Edit'

    fill_in 'Title', :with => 'Boston Herald'
    click_button 'Save Link'

    page.should have_content('Boston Herald')
    page.should have_no_content('Big Picture')
  end

  it "deletes pages" do
    visit my_links_path

    click_link 'Big Picture'
    click_link 'Delete'
    click_button 'Confirm'

    page.should have_content('XKCD')
    page.should have_no_content('Big Picture')
  end
end
