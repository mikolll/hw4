class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    if @current_user
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
    end
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place.save
    redirect_to "/places"
  else
    flash["notice"] = "Please login first."
  end
  redirect_to "/places"
end
  end

