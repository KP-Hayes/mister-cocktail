class DosesController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def update
    @dose
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: "Your dose was deleted!"
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
