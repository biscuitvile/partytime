class ApplicationController < ActionController::Base
  helper_method :rooms

  def rooms
    @rooms ||= GuestsParser.new(rooms_response).call
  end

  def rooms_response
    @rooms_response ||= RestClient.get(
      "https://api.daily.co/v1/presence",
      "Authorization" => "Bearer #{Rails.application.credentials.dailyco[:api_key]}",
      "Content-Type" => "application/json"
    )
  end
end
