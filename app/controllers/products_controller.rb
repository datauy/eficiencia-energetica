class ProductsController < ApplicationController
  def index
    if(params[:litres])
      litres = params[:litres].split(',')
      @products = Product.where(litres: litres[0]..litres[1])
    else
      @products = Product.all
    end
  end

  def filter
    permitted_params

    query = Product
    query.where(brand: permitted_params[:brand]) unless permitted_params[:brand].present?
    query.where(model: permitted_params[:model]) unless permitted_params[:model].present?

    @number_of_years = permitted_params[:number_of_years]
    @products = query.all.map do |product|
      product.calculated_yearly_cost =
        product.yearly_cost(@number_of_years)
    end

    render :index
  end

  private

  def permitted_params
    params.permit(:brand, :model, :number_of_years)
  end
end
