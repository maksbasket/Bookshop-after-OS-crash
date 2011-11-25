class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  validates :price, :numericality => {
    :greater_than_or_equal_to => 0.01,
    :message => 'must be positive'
  }
  validates :product, :presence => true

  def total_price
    price * quantity
  end
end
