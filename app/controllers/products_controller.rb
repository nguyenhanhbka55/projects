class ProductsController < ApplicationController

  #before_action :set_product, only: [:show, :edit, :update, :delete]
  def index
    #@products = Product.where('price = 0.45')
    @products = Product.find_by_sql("select * from products")    
    #@products = Product.all   
    
    #@products = Product.where("name LIKE?",'%l%')
    #@products = Product.where.not(id:[2,5])    
    #render :nothing => true, :status => 401
    #render json: @products 
    #render xml: @products    
  end

  def search
    @products = Product.search(params[:name])
    #if !@products.blank? 
     # render template: "products/search"    
    #else
     # redirect_to action: 'index'
    #end
    #redirect_to search_path(params[:search])
  end

  def show
    
    @product = Product.find(params[:id])     
        
    #render for view format 
    #render json: @product
    #render xml: @product
  end  

  def create
   @product = Product.new(params[:id])
  
    if @product.save      
      redirect_to action: 'index' , notice: 'Product was sucessful created'
    else
      render action: 'new', alert: 'Product could not be create', :layout => false
    end    
  end

  def new
    @product = Product.new
  end

  def edit
    
  end
  private
  def set_product
    @product = Product.find(params[:id])  
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end  
end