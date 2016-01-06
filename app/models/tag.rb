class Tag < ActiveRecord::Base
  has_many :point_of_interest_tag_links
  has_many :point_of_interests, through: :point_of_interest_tag_links
end
