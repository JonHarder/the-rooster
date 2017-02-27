class UnitsController < ApplicationController
  def new
  end

  def create
    @unit = Unit.new(unit_params)
    @unit.save
    redirect_to @unit
  end

  def index
    @units = Unit.all.sort {|a,b| a.name <=> b.name}
  end

  def show
    @unit = Unit.find(params[:id])
  end

  private
  def unit_params
    params.require(:unit).permit(:name)
  end
end
