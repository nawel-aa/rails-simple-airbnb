require 'open-uri'
require 'json'

class FlatsController < ApplicationController
  before_action :find_flat, only: (:show)

  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    address = CGI.escape(@flat.address)
    coordinates_url = "http://api.mapbox.com/geocoding/v5/mapbox.places/#{address}.json?access_token=pk.eyJ1IjoibmF3ZWxpd2VsbyIsImEiOiJja2d3aXM4MTAwYW13MnhvM3pianE3dDBrIn0.9VUFokyb6AlwRvQWtID49Q"
    coordinates = JSON.parse(open(coordinates_url).read)

  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
