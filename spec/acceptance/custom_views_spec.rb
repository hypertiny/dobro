require 'spec_helper'

describe 'custom views', :driver => :rack_test do
  before :each do
    Widget.create! :name => 'Thing'
  end

  it "uses the custom show template" do
    visit widgets_path
    click_link 'Thing'

    page.should have_content('Widget Name: Thing')
  end

  it "uses the custom form partial as part of the new view" do
    visit widgets_path

    click_link 'New Widget'

    page.should have_content('Name')
    page.should_not have_content('Created at')
  end

  it "uses the custom form partial as part of the edit view" do
    visit widgets_path

    click_link 'Thing'
    click_link 'Edit'

    page.should have_content('Name')
    page.should_not have_content('Created at')
  end
end
