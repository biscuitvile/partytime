class AddGuestsToTables < ActiveRecord::Migration[6.1]
  def change
    add_reference :guests, :table
  end
end
