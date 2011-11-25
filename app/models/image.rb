class Image < ActiveRecord::Base
  
  belongs_to :product

  image_accessor :file

  validates :file, :presence => true
  validates_property :format, :of => :file, :in => [:jpg, :png, :gif]

end
