class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[ show edit update destroy ]

  # GET /portfolios or /portfolios.json
  def index
    @portfolios_items = Portfolio.all
  end

  def new
    @portfolios_item = Portfolio.new
  end

  def create
    @portfolios_item = Portfolio.new(portfolio_params)
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

  def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
  end

  def edit
      @portfolios_item = Portfolio.find(params[:id])
  end

  def update
    @portfolios_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolios_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @portfolios_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def set_portfolio
    @portfolios_item = Portfolio.find(params[:id])
  end

end
