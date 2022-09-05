class VisitorsController < ApplicationController

  def new
  end

  def create
    pp visitor_params
    visitor = Visitor.new(visitor_params)
    if visitor.save
      session[:visitor_id] = visitor.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end  

  private

  def visitor_params
    params.require(:visitor).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
