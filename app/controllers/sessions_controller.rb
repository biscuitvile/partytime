class SessionsController < ApplicationController

  def create
    guest = Guest.create(name: params[:name])
    session[:guest_id] = guest.id

    redirect_to :root
  end

  def destroy
    current_guest.destroy

    redirect_to :root
  end

end
