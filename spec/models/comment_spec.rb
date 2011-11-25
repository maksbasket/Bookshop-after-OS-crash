require 'spec_helper'

describe Comment do

  it "should be created by Product's creation" do
    expect { Factory(:product) }.to change(Comment, :count).by(1)
  end

  it { should validate_presence_of(:text) }

  it { should validate_presence_of(:product) }
  
  it "should remove all comments with ptoduct" do
    product = Factory(:product)
    user = Factory(:user)
    comments_count = 10
    comments_count.times do
      Factory(:comment, :product => product, :user => user)
    end
    expect { product.destroy }.to change(Comment, :count).by(-comments_count - 1)
  end
end
