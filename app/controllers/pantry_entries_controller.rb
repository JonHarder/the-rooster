class PantryEntriesController < ApplicationController
  def new
    @ingredients = Ingredient.all.sort {|a,b| a.name <=> b.name}
    @units = Unit.all.sort {|a,b| a.name <=> b.name }
  end

  def index
    @entries = PantryEntry.all
  end

  def create
    if ingredient_by_id.nil?
      @entry = PantryEntry.new(pantry_params)
      @entry.save
      redirect_to @entry
    else
      entry = PantryEntry.find_by ingredient_id: pantry_params[:ingredient_id]
      amount = pantry_params[:amount].to_f
      entry.amount += amount
      entry.save
      redirect_to entry
      return
    end
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

  def ingredient_by_id
    Ingredient.find(params[:pantry_entry][:ingredient_id])
  end
end
