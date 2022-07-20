class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  def create 
    birds = Bird.create(birds_params)
    render json: birds, status: :created
  end 

  private birds_params
    params.permit(:name, :species) 
  end

end