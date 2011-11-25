Factory.sequence :title do |i|
  "Programming Ruby 1.9.#{i}"
end

Factory.sequence :pay_type_name do |i|
  "Pay type #{i}"
end

FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "user"
    password_confirmation "user"
    remember_me false
    name "user"
    role "user"
  end

  factory :admin, :class => User do
    email "admin@example.com"
    password "admin"
    password_confirmation "admin"
    remember_me false
    name "admin"
    role "admin"
  end

  factory :ruby, :class => Product do
    title 'Programming Ruby 1.9'
    description %{
        <p>Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>}
    price 49.50
  end

  factory :product do
    title { Factory.next :title }
    description 'Cool book!'
    price 11.11
  end

  factory :image do
    file File.new("#{Rails.root}/spec/fixtures/images/ruby.jpg")
  end
  
  factory :comment do
    product { Factory(:product) }
    user { Factory(:user) }
    text 'Trololo.'
    parent_id { product.root_comment.id }
  end

  factory :cart

  factory :pay_type do
    name { Factory.next :pay_type_name }
  end

  factory :line_item do
    price 12.34
    product { Factory(:product) }
  end

  factory :order do
    user { Factory(:user) }
    name "Customer"
    address "1st Main Street"
    email "customer@example.com"
    pay_type { Factory(:pay_type) }
    line_items { [Factory(:line_item)] }
  end
end
