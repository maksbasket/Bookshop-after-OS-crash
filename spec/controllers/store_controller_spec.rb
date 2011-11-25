require 'spec_helper'

describe StoreController do
  render_views

  describe "GET 'index'" do

    before { get :index }
    it { should respond_with(:success) }
    
    it "should show the Product" do
      product = Factory(:ruby)
      get :index
      response.should have_selector(".entry", :count => 1)
      response.should have_selector("h3", :content => product.title)
    end
  end
end
