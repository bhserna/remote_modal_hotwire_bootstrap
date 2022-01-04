class ProductsController < ApplicationController
  def index
    @products = Product.order(id: :desc)
  end

  def new
    @product = Product.new 
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
