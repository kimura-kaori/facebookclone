class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(image: params[:picture][:image], content: params[:picture][:content])
    if @picture.save
      redirect_to pictures_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(params.require(:picture).permit(:title, :content))
      redirect_to pictures_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"削除しました！"
  end

  private
  def set_picture
    @picture = Picture.find(params[:id])
  end


  # def picture_params
  #   params.require(:picture).permit(:image, :content)
  # end
end
