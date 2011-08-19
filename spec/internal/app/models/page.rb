class Page < ActiveRecord::Base
  def identifier
    name
  end
end
