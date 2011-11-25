class Product < ActiveRecord::Base
  
  has_many :images, :dependent => :destroy
  has_many :comments
  has_many :line_items
  has_many :orders, :through => :line_items

  accepts_nested_attributes_for :images, :allow_destroy => true

  validates :title, :description, :presence => true
  validates :price, :numericality => {
    :greater_than_or_equal_to => 0.01,
    :message => 'must be positive'
  }
  validates :title, :uniqueness => true, :length => { :minimum => 10 }
  
  after_create :create_root_comment
  before_destroy :destroy_root_comment
  before_destroy :ensure_not_referenced_by_any_line_item

  def root_comment
    @root_comment ||= Comment.where(:parent_id => nil,
                                    :product_id => id).first if id
  end

  private

  def create_root_comment
    Comment.create!(:product => self,
                    :text => 'root',
                    :parent_id => nil)
  end
  
  def destroy_root_comment
    root_comment.destroy
  end

  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add :base, "Some cart contents #{title}"
      return false
    end
  end
end
