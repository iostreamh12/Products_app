class ProductsController < ApplicationController

  def index
    @product = Product.search_and_order(params[:search], params[:page])
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    flash[:success] = "Producto Guardado"
    redirect_to product_path
  end

  private
    def product_params
      params.require(:product).permit(:clave, :descripcion, :tipoventa, :preciocompra, :precioventa)
    end
end
