class ProductsController < ApplicationController
  #before_action :set_product, only: [:show, :index]

  def index
    @products = Product.all     
  end

  def show
    @product = Product.find(params[:id])
  end

  #private 
  #def set_product
   # @product
  #end

end
