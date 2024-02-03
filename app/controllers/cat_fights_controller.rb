class CatFightsController < ApplicationController

  def index
    cats = CatFight.all
    render json: cats
  end

  def create
    # Create a new cat
    cat = CatFight.create(cat_params)
    render json: cat
  end

  def update
  end

  def destroy
  end

  # Handle strong parameters, so we are secure
  private
  def cat_params
    params.require(:cat_fight).permit(:name, :age, :enjoys, :image)
  end


end
