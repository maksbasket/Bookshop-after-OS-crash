require 'spec_helper'

describe Order do

  it "should create a new instance given valid attributes" do
    expect { Factory(:order) }.to change(Order, :count).by(1)
  end

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:address) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:pay_type) }
end
