class ProductsController < ApplicationController
  def index
    litres = permitted_params[:litres].split(',') if(permitted_params[:litres])
    query = Product

    query = query.where(litres: litres[0]..litres[1]) if permitted_params[:litres].present?
    query = query.where(brand: permitted_params[:brand]) if permitted_params[:brand].present?
    query = query.where(model: permitted_params[:efficiency_class]) if permitted_params[:efficiency_class].present?

    @number_of_years = permitted_params[:number_of_years].to_i || 2

    @products = query.all.map do |product|
      product.calculated_yearly_cost =
        product.yearly_cost(@number_of_years)

      product
    end

    @brands = Product.select('DISTINCT products.brand').map(&:brand)
    @efficiency_classes = Product.select('DISTINCT efficiency_class').map(&:efficiency_class)
    @number_of_years_list = [1, 2, 5, 10, 20]
  end

  private

  def permitted_params
    params.permit(:brand, :efficiency_class, :number_of_years, :litres)
  end
end
