class Resource < ActiveRecord::Base
  include ResourceRepository

  belongs_to :user
end
