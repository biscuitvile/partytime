class TablesController < ApplicationController
  helper_method :table

  def table
    @table ||= Table.find_by(name: params[:name])
  end

  def create
    RestClient.post(
      "https://api.daily.co/v1/rooms",
      {
        name: name,
        properties: {
          exp: (Time.now + 1.day).to_i,
          enable_chat: true
        }
      }.to_json,
      "Authorization" => "Bearer #{Rails.application.credentials.dailyco[:api_key]}",
      "Content-Type" => "application/json"
    ) do |response|
      if response.code == 200
        table = Table.create(name: name)
        current_guest.update(table: table)
        redirect_to table
      end
    end

  end

  def show
    current_guest.update(table: table)
    session[:current_table] = params[:name]
  end

  private

  def name
    @name ||= Faker::Food.dish.parameterize
  end
end
