class City < ActiveRecord::Base
  has_many :point_of_interests
end
