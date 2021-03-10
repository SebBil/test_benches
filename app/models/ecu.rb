class Ecu < ActiveRecord::Base
  belongs_to :bench

  validates :name, presence: true
end
