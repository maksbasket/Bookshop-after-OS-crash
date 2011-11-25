require 'spec_helper'

describe PayType do

  it "should create a new instance given valid attributes" do
    expect { Factory(:pay_type) }.to change(PayType, :count).by(1)
  end

  it { should validate_presence_of(:name) }

  subject { Factory(:pay_type) }
  it { should validate_uniqueness_of(:name) }
end
