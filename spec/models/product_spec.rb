require 'spec_helper'

describe Product do

  it "should create a new instance given valid attributes" do
    expect { Factory(:ruby) }.to change(Product, :count).by(1)
  end

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:description) }

  it { should_not allow_value(0.009).for(:price) }

  subject { Factory(:ruby) }
  it { should validate_uniqueness_of(:title) }

  it { should_not allow_value('123456789').for(:title) }
end
