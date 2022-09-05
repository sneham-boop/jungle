class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end

  def create
    visitor = Visitor.find_by_email(params[:email])
    if visitor && visitor.authenticate(params[:password])
      session[:visitor_id] = visitor.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:visitor_id] = nil
    redirect_to login_path
  end
end
