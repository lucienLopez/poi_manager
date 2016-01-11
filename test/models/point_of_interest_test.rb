require 'test_helper'

class PointOfInterestTest < ActiveSupport::TestCase
  eiffel_tower = PointOfInterest.find_by(default_name: 'Tour Eiffel')
  test 'search' do
    assert PointOfInterest.search('Eiffel').include?(eiffel_tower), 'Basic search'
  end
  test 'search_translation' do
    assert PointOfInterest.search('tower').include?(eiffel_tower), 'Search in translations'
  end
  test 'search_case' do
    assert PointOfInterest.search('EiFfeL').include?(eiffel_tower), 'Search not affected by case'
  end
  test 'search_tag' do
    assert PointOfInterest.search('first_tag').include?(eiffel_tower), 'Search with tag'
  end
end
