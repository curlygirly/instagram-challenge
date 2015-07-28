class PhotosController < ApplicationController

  def photo_params
    params.require(:photo).permit(:name)
    end

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/photos'
  end
end
