class Task < ActiveRecord::Base
  def identifier
    description
  end
end
