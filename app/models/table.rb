class Table < ApplicationRecord

  has_many :guests

  validates :name, presence: true

  after_destroy :cleanup

  def to_param
    name
  end

  def self.cleanup!
    all.each do |table|
      table.destroy if table.guests.count.zero?
    end
  end

  def cleanup
    RestClient.delete(
      "https://api.daily.co/v1/rooms/#{name}",
      "Authorization" => "Bearer #{Rails.application.credentials.dailyco[:api_key]}",
      "Content-Type" => "application/json"
    )
  end

end
