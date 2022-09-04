class Admin::DashboardController < ApplicationController
  def show
    @products = Product.order(id: :desc).all
    @quantity = @products.count()
    @categories = @products.map {|product| product[:category_id]}.uniq.length
  end
end
