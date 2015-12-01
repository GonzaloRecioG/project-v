class ExperiencesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :new, :show, :create]

  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      redirect_to experience_path(@experience.id)
    else
      render :new
    end
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def destroy
  end

  private

  def experience_params
    params.require(:experience).permit(:name, :description, :address, :city, :day, :duration, :category, :picture)
  end

end
