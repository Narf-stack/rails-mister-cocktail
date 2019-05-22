class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    if @dose.destroy
      redirect_to cocktail_path(@cocktail)
    else
      render :show
    end
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
