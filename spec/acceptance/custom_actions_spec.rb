require 'spec_helper'

describe 'custom controller and actions' do
  before :each do
    Task.create :description => 'Test first', :approved => false
  end

  it 'can use custom routes to approve a task' do
    visit tasks_path

    click_link 'Test first'
    click_link 'Approve'
    click_button 'Confirm'

    first(:xpath, "//dd[preceding-sibling::dt[.='Approved']]").text.
        should == 'true'
  end
end
