class Link < ActiveRecord::Base
  def identifier
    title
  end
end
