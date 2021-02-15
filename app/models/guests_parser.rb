class GuestsParser

  def initialize(response)
    @response = response
  end

  def call
    body
  end

  private

  attr_reader :response

  def body
    @body ||= JSON.parse(response.body)
  end

end
