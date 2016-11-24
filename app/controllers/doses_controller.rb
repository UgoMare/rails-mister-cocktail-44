class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create]

  def create
    # @dose = Dose.new(dose_params)
    # @dose.cocktail = Cocktail.find(params[:cocktail_id])
      @dose = @cocktail.doses.build(dose_params)
      if @dose.save
        redirect_to @cocktail
      else
        render :new
      end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
