class Guest < ApplicationRecord

  belongs_to :table, optional: true

  validates :name, presence: true

end
