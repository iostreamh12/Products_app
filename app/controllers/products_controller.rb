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

  def update
    old_username = @user.username
    new_params = user_params.dup
    new_params[:username] = new_params[:username].strip
    new_params[:email] = new_params[:email].strip
    
    @user.username = new_params[:username]
    @user.email = new_params[:email]
    @user.password = new_params[:password] if new_params[:password].strip.length > 0
    @user.password_confirmation = new_params[:password_confirmation] if new_params[:password_confirmation].strip.length > 0
    
    if current_user.id != @user.id
      @user.admin = new_params[:admin]=="0" ? false : true
      @user.locked = new_params[:locked]=="0" ? false : true
    end
    
    if @user.valid?
      @user.skip_reconfirmation!
      @user.save
      redirect_to admin_users_path, notice: "#{@user.username} updated."
    else
      flash[:alert] = "#{old_username} couldn't be updated."
      render :edit
    end
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
