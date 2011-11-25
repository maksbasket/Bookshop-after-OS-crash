class PayType < ActiveRecord::Base
  has_many :orders

  validates :name, :presence => true, :uniqueness => true
end
