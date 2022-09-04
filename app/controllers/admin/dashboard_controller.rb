class Admin::DashboardController < ApplicationController
  def show
    @products = Product.order(id: :desc).all
    @quantity = @products.count()
    # .map {|product| product[:quantity]}.sum
    @categories = @products.map {|product| product[:category_id]}.uniq.length
  end
end
