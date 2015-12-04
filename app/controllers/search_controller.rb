class SearchController < ApplicationController

  def index
    @experiences = Experience.all
    @experiences = @experiences.where(city: params[:city]) unless params[:city].blank?
    @experiences = @experiences.where(category: params[:category]) unless params[:category].blank?
    @search_query = params[:search]

    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@experiences) do |experience, marker|
      marker.lat experience.latitude
      marker.lng experience.longitude
    end
  end
end
