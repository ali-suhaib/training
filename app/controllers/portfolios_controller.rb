class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[ show edit update destroy ]

  # GET /portfolios or /portfolios.json
  def index
    @portfolios_item = Portfolio.all
  end

  def new
    @portfolios_item = Portfolio.new
  end

  def create
    @portfolios_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolios_item.save
        format.html { redirect_to portfolios_path, notice: "Portfolio is live now." }
        format.json { render :show, status: :created, location: @portfolios_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @portfolios_item.errors, status: :unprocessable_entity }
      end
    end
  end
   def portfolia_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
    end
end
