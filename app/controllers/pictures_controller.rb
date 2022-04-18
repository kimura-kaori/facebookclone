class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(image: params[:picture][:image], content: params[:picture][:content])
    if @picture.save
      redirect_to blogs_path, notice: "投稿しました！"
    else
      render :new
    end
  end
  #
  # def show
  # end
  #
  # def edit
  # end
end
