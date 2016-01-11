class PointOfInterestsController < ApplicationController
  before_action :set_point_of_interest, only: [:show, :edit, :update, :destroy]

  def index
    @search = params[:search]
    @point_of_interest_count = PointOfInterest.all.count
    @point_of_interests = PointOfInterest.search(params[:search]).order(:default_name).page params[:page]
  end

  def destroy
    @point_of_interest.destroy
    redirect_to point_of_interests_url, notice: 'Point of interest was successfully destroyed.'
  end

  def show
  end

  def update
    if @point_of_interest.update(point_of_interest_params)

      if params.has_key? :translation
        params[:translations].each do |translation_hash|
          # If there is no text, we assume the user wanted to delete translation
          if translation_hash['text'] != ''
            translation = Translation.find_or_create_by(language_id: translation_hash['language_id'],
                                                        point_of_interest: @point_of_interest)
            translation.update(text: translation_hash['text'])
            translation.save
          else
            translation = Translation.find_by(language_id: translation_hash['language_id'],
                                              point_of_interest: @point_of_interest)
            translation.delete if translation
          end
        end
      end

      if params.has_key? :reviews
        params[:reviews].each do |review_hash|
          # If there is no text, we assume the user wanted to delete review
          if review_hash['text'] != ''
            review = Review.find_or_create_by(user_id: review_hash['user_id'],
                                              point_of_interest: @point_of_interest)
            review.update(text: review_hash['text'])
            review.save
          else
            review = Review.find_or_create_by(user_id: review_hash['user_id'],
                                              point_of_interest: @point_of_interest)
            review.delete if review
          end
        end
      end

      if params.has_key? :tags
        @point_of_interest.tags = []
        params[:tags].each do |tag_id|
          @point_of_interest.tags << Tag.find(tag_id)
        end
      end

      redirect_to @point_of_interest, notice: 'Point of interest was successfully updated.'
    else
      render :edit
    end
  end

  def edit
    @cities = City.all.order(:name)
    @tags = Tag.all.order(:name)
    languages = Language.all.order(:name)
    @languages = []
    # We'll display one line per language, with its translation if one is found
    languages.each do |language|
      language_hash = {
          name: language.name,
          id: language.id,
          translation: Translation.find_by(language: language, point_of_interest: @point_of_interest).try(:text)
      }
      @languages << language_hash
    end
  end

  def new
    @point_of_interest = PointOfInterest.new

    @cities = City.all.order(:name)
    @tags = Tag.all.order(:name)
    languages = Language.all.order(:name)
    @languages = []
    languages.each do |language|
      language_hash = {
          name: language.name,
          id: language.id,
          translation: ''
      }
      @languages << language_hash
    end
  end

  def create
    @point_of_interest = PointOfInterest.new(point_of_interest_params)

    if @point_of_interest.save
      if params.has_key? :translations
        params[:translations].each do |translation_hash|
          if translation_hash['text'] != ''
            Translation.create(language_id: translation_hash['language_id'],
                               point_of_interest: @point_of_interest,
                               text: translation_hash['text'])
          end
        end
      end

      if params.has_key? :reviews
        params[:reviews].each do |review_hash|
          if review_hash['text'] != ''
            Review.create(user_id: review_hash['user_id'],
                          point_of_interest: @point_of_interest,
                          text: review_hash['text'])
          end
        end
      end

      if params.has_key? :tags
        params[:tags].each do |tag_id|
          @point_of_interest.tags << Tag.find(tag_id)
        end
      end

      redirect_to @point_of_interest, notice: 'Point of interest was successfully created.'
    else
      render :new
    end
  end

  private
    def set_point_of_interest
      @point_of_interest = PointOfInterest.find(params[:id])
    end

    # Only allow trusted parameters
    def point_of_interest_params
      params.require(:point_of_interest).permit(:default_name, :city_id, :address, :latitude, :longitude)
    end
end
