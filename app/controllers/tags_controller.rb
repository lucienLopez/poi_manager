class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all.order(:name)
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: 'Point of interest was successfully destroyed.'
  end


  private
  def set_tag
    @tag = Tag.find(params[:id])
  end
end