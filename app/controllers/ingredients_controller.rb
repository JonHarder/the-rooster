class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all.sort {|a,b| a.name <=> b.name }
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.name = @ingredient.name.singularize
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
