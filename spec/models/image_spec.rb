require 'spec_helper'

describe Image do

  it "should create a new instance given valid attributes" do
    expect { Factory(:image) }.to change(Image, :count).by(1)
  end

  it { should validate_presence_of(:file) }

  %w{ debug.jpg logo.png rails.png rtp.jpg ruby.jpg wd4d.jpg }.each do |url|
    it { should allow_value(attach_image url).for(:file) }
  end

  %w{ fred.doc fred.pdf }.each do |url|
    it { should_not allow_value(attach_image url).for(:file) }
  end
end
