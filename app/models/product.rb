class Product < ActiveRecord::Base
  KWATT_HOUR_COST = 3

  def monthly_cost
    kwatts_hour * KWATT_HOUR_COST
  end

  def yearly_cost(number_of_years)
    monthly_cost * number_of_years
  end

  def calculated_yearly_cost=(number_of_years)
    @calculated_yearly_cost = yearly_cost(number_of_years)
  end

  def calculated_yearly_cost
    @calculated_yearly_cost || yearly_cost(2)
  end
end
