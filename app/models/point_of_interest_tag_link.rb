class PointOfInterestTagLink < ActiveRecord::Base
  belongs_to :tag
  belongs_to :point_of_interest
end
