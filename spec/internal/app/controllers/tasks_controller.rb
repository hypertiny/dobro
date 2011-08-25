class TasksController < Dobro::ApplicationController
  def approve
    current_record.update_attributes(:approved => true)
    redirect_to current_record
  end
end
