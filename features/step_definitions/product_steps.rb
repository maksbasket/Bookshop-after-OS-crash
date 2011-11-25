Given /^I have not orders$/ do
  Order.destroy_all
end

Given /^depot have (\d+) products$/ do |count|
  count.to_i.times do
    Factory(:product)
  end
end

Given /^depot have (.+) payment types$/ do |pay_names|
  pay_names.split(', ').each do |pay_name|
    Factory(:pay_type, :name => pay_name)
  end
end

When /^I go to the store page$/ do
  visit '/store'
end

Then /^I see (\d+) entries$/ do |count|
  all('.entry').count.should == count.to_i
end

When /^I add the product to cart$/ do
  click_button('Add to Cart')
end

Then /^Cart shows$/ do
  page.should have_button('Checkout')
end

When /^I checkout the Cart$/ do
  click_button('Checkout')
end

Then /^I see Order's form$/ do
  page.should have_content('Please Enter Your Details')
end

When /^I create an Order$/ do
  fill_in('Name', :with => 'Simple User')  
  fill_in('Address', :with => 'My address')  
  fill_in('Email', :with => 'simpleuser@example.com')
  select('Check', :from => 'Pay type')
  click_button('Create Order')
end

Then /^I receive email from (.+)$/ do |email|
  mail = ActionMailer::Base.deliveries.last
  mail[:from].value.should == email
  mail.to.first.should == 'simpleuser@example.com'
end

Given /^I am admin$/ do
  admin = Factory(:admin)
  visit '/users/sign_in'
  fill_in('Email', :with => admin.email)
  fill_in('Password', :with => admin.password)
  click_button('Sign in')
end

Given /^I have (\d+) orders$/ do |count|
  user = User.first
  count.to_i.times do
    Factory(:order, :user => user)
  end
end

When /^I go to the orders page$/ do
  visit '/orders'
end

Then /^I see (\d+) orders$/ do |count|
  all('tr').count.should == count.to_i
end

When /^I click show link$/ do
  click_link('Show')
end

When /^I click shipped button$/ do
  click_button('Shipped')
end

Then /^buyer receive an email from (.+)$/ do |email|
  mail = ActionMailer::Base.deliveries.last
  mail[:from].value.should == email
  mail.subject.should == 'Pragmatic Store Order have shipped'
end

When /^I try to see (.+)$/ do |path|
  visit path
end

Then /^admin receive email from (.+)$/ do |email|
  mail = ActionMailer::Base.deliveries.last
  mail[:from].value.should == email
  mail.to.first.should == 'depotadmin@example.com'
  mail.subject.should == 'Depot failure'
end
