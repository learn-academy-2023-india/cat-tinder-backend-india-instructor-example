class CatFightsController < ApplicationController

  def index
    cats = CatFight.all
    render json: cats
  end

  def create
    cat = CatFight.create(cat_params)
    render json: cat
  end

  def update
    cat = CatFight.find(params[:id])
    cat.update(cat_params)
    render json: cat
  end

  def destroy
    cat = CatFight.find(params[:id])
    cat.destroy
  end

  private
  def cat_params
    params.require(:cat_fight).permit(:name, :age, :enjoys, :image)
  end

end
