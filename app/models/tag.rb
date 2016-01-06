class Tag < ActiveRecord::Base
  has_many :point_of_interest_tag_links
end
