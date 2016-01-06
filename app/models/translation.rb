class Translation < ActiveRecord::Base
  belongs_to :language
  belongs_to :point_of_interest
end
