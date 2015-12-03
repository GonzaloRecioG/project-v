class ExperiencesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :index


  def index
    # respond_to do |format|
    #   format.html { render :layout => 'home' }
    # end
    @experiences = Experience.where.not(latitude: nil) #.all

    @markers = Gmaps4rails.build_markers(@experiences) do |experience, marker|
      marker.lat experience.latitude
      marker.lng experience.longitude
    end
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.set_user!(current_user)
    if @experience.save
      redirect_to experience_path(@experience.id)
    else
      render :new
    end
  end

  def show
    @experience = Experience.find(params[:id])
    @experience_coordinates = { lat: @experience.latitude, lng: @experience.longitude}  #raw method
  end

  def destroy
  end

  private

  def experience_params
    params.require(:experience).permit(:name, :description, :address, :city, :day, :duration, :category, :picture, :user_id)
  end

end
