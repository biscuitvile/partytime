class Table < ApplicationRecord

  has_many :guests

  validates :name, presence: true

  def to_param
    name
  end

end
