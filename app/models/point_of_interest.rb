class PointOfInterest < ActiveRecord::Base
  belongs_to :city
  has_many :translations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :point_of_interest_tag_links, dependent: :destroy
  has_many :tags, through: :point_of_interest_tag_links

  def self.search(search)
    if search && search != ''
      where('default_name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
