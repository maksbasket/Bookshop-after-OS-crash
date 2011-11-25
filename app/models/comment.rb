class Comment < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :text, :product, :presence => true
  
  acts_as_nested_set :scope => [:product_id]
end
