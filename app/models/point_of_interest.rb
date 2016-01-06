class PointOfInterest < ActiveRecord::Base
  belongs_to :city
  has_many :translations
  has_many :reviews
  has_many :point_of_interest_tag_links
end
