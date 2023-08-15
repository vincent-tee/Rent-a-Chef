class OffersController < ApplicationController
  before_action :set_offer, only: [:show]
  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:cuisine, :price_pp, :title)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
