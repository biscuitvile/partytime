class TablesController < ApplicationController

  def create
    RestClient.post(
      "https://api.daily.co/v1/rooms",
      {
        name: room_name,
        properties: {
          exp: (Time.now + 1.day).to_i,
          enable_chat: true
        }
      }.to_json,
      "Authorization" => "Bearer #{Rails.application.credentials.dailyco[:api_key]}",
      "Content-Type" => "application/json"
    )

    redirect_to action: "show", id: room_name
  end

  def show
    session[:current_room] = params[:id]
  end

  private

  def room_name
    @room_name ||= Faker::Food.dish.parameterize
  end
end
