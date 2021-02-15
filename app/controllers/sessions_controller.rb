class SessionsController < ApplicationController

  def create
    session[:guest] = params[:name]

    redirect_to :root
  end

  def destroy
    session[:guest] = nil

    redirect_to :root
  end

end
