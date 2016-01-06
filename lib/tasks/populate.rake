namespace :db do
  desc "fill database"
  task :populate => :environment do
    require 'faker'

    #city
    (0..200).each do
      City.create!(name: Faker::Address.city)
    end

    # Point of interests
    (0..500).each do |number|
      default_name = Faker::Lorem.word + number.to_s
      city = City.order('RANDOM()').first
      PointOfInterest.create!(default_name: default_name, city: city)
    end

    # Users
    (0..200).each do |number|
      email = number.to_s + Faker::Internet.safe_email
      last_name = Faker::Name.last_name
      first_name = Faker::Name.first_name
      password = Devise.friendly_token.first(8)

      User.create!(email: email, last_name: last_name, first_name: first_name, password: password)
    end

    # Reviews
    (0..1500).each do
      text = Faker::Lorem.sentence
      user = User.order('Random()').first
      poi = PointOfInterest.order('Random()').first

      Review.create!(text: text, user: user, point_of_interest: poi)
    end

    # Tags
    (0..200).each do
      Tag.create!(name: Faker::Company.buzzword)
    end

    (0..1500).each do
      poi = PointOfInterest.order('Random()').first
      tag = Tag.order('Random()').first
      PointOfInterestTagLink.create!(tag: tag, point_of_interest: poi)
    end

    #languages
    [:french, :german, :english, :spanish, :japanese, :vietnamese, :italian].each do |language|
      Language.create name: language
    end

    #translations
    (0..1500).each do
      language = Language.order('Random()').first
      poi = PointOfInterest.order('Random()').first

      Translation.create(language: language, point_of_interest: poi)
    end

  end
end