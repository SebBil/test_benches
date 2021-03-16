class Bench < ActiveRecord::Base
  has_many :ecus

  validates :name, presence: true
  validates :vin, presence: true
  validates :platform, presence: true
  
  #enum bench_platform: [ :PLT1, :PLT2, :PLT3 ]

end
