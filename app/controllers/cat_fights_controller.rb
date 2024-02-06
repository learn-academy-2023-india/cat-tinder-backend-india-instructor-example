class CatFightsController < ApplicationController

  def index
    cats = CatFight.all
    render json: cats
  end

  def create
    cat = CatFight.create(cat_params)
    if cat.valid?
      render json: cat
    else
      render json: cat.errors, status: 422
    end
  end

  def update
    cat = CatFight.find(params[:id])
    cat.update(cat_params)
    if cat.valid?
      render json: cat
    else
      render json: cat.errors, status: 422
    end
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
