class PartyController < ApplicationController
  helper_method :tables

  private

  def tables
    @tables ||= Table.all
  end
end
