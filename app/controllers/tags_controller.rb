class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all.order(:name)
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: 'Tag was successfully destroyed.'
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_url, notice: 'Tag was successfully updated.'
    else
      render :edit
    end
  end


  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end