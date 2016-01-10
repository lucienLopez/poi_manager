class PointOfInterest < ActiveRecord::Base
  belongs_to :city
  has_many :translations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :point_of_interest_tag_links, dependent: :destroy
  has_many :tags, through: :point_of_interest_tag_links

  def self.search(search)
    if search && search != ''
      search.downcase!
      joins('LEFT JOIN translations ON translations.point_of_interest_id = point_of_interests.id '\
      'LEFT JOIN point_of_interest_tag_links ON point_of_interest_tag_links.point_of_interest_id = point_of_interests.id '\
      'LEFT JOIN tags ON tags.id = point_of_interest_tag_links.tag_id').
          where('LOWER(default_name) LIKE ? OR LOWER(translations.text) LIKE ? OR LOWER(tags.name) LIKE ?',
                "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
