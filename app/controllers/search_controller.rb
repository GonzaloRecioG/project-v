class SearchController < ApplicationController

  def index
    @experiences = Experience.all
    @experiences = @experiences.where(city: params[:city]) unless params[:city].blank?
    @experiences = @experiences.where(category: params[:category]) unless params[:category].blank?
    @search_query = params[:search]
  end
end
