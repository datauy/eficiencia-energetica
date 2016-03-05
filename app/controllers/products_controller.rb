class ProductsController < ApplicationController
  def index
    if(params[:litres])
      litres = params[:litres].split(',')
      @products = Product.where(litres: litres[0]..litres[1])
    else
      @products = Product.all
    end
  end
end
