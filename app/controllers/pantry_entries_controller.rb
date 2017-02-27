class PantryEntriesController < ApplicationController
  def new
    @ingredients = Ingredient.all.sort {|a,b| a.name <=> b.name}
    @units = Unit.all.sort {|a,b| a.name <=> b.name }
  end

  def index
    @entries = PantryEntry.all
  end

  def create
    @entry = PantryEntry.new(pantry_params)
    @entry.save
    redirect_to @entry
  end

  def show
    @entry = PantryEntry.find(params[:id])
    @ingredient = Ingredient.find(@entry.ingredient_id)
    @unit = Unit.find(@entry.unit_id)
  end

  def edit
    @entry = PantryEntry.find(params[:id])
  end

  def update
    @entry = PantryEntry.find(params[:id])
    @entry.update(pantry_update_params)
    redirect_to @entry
  end

  private
  def pantry_params
    params.require(:pantry_entry).permit(:ingredient_id, :amount, :unit_id)
  end

  def pantry_update_params
    params.require(:pantry_entry).permit(:amount)
  end
end
