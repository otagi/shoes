class ShoesController < ApplicationController
  before_action :set_shoe, only: [:show, :edit, :update, :destroy, :hovercard]

  def index
    @shoes = Shoe.all
  end

  def show
  end

  def new
    @shoe = Shoe.new
  end

  def edit
  end

  def create
    @shoe = Shoe.new(shoe_params)

    if @shoe.save
      redirect_to @shoe, notice: 'Shoe was successfully created.'
    else
      render :new
    end
  end

  def update
    if @shoe.update(shoe_params)
      redirect_to @shoe, notice: 'Shoe was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shoe.destroy
    redirect_to shoes_url, notice: 'Shoe was successfully destroyed.'
  end

  def hovercard
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoe
      @shoe = Shoe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shoe_params
      params.require(:shoe).permit(:name, :brand, :colorway, :price, :image)
    end
end
