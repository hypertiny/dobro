class Author < ActiveRecord::Base
  def identifier
    name
  end
end
