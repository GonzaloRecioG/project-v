class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
  end

  def create
  end

  def show
  end

  def destroy
  end

  private

  def experience_params
    params.require(:experience).permit(:name, :description, :address, :city, :day, :duration, :category, :picture)
  end

end
