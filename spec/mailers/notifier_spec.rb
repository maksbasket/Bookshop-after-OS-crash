require "spec_helper"

describe Notifier do
  describe "order_received" do
    let(:mail) do
      @order = Factory(:order)
      Notifier.order_received(@order)
    end

    it "renders the headers" do
      mail.subject.should eq("Pragmatic Store Order Confirmation")
      mail.to.should eq([@order.email])
      mail.from.should eq(["depot@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match(@order.name)
    end
  end
end
