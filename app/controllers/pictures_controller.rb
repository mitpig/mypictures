class PicturesController < ApplicationController
  def index
    @pictures = current_user.pictures.order(id: :desc)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to pictures_path, notice: '写真をアップロードしました'
    else
      redirect_to pictures_path, alert: "error: #{@picture.errors.full_messages}"
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :image)
  end
end
