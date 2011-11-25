#***Product***

Product.create!(:title => 'Web Design for Developers',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :price => 42.95)

Product.create!(:title => 'Programming Ruby 1.9',
  :description =>
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  :price => 49.50)

Product.create!(:title => 'Rails Test Prescriptions',
  :description => 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  :price => 43.75)


#***Image***

image_filenames = %w{ debug.jpg rtp.jpg ruby.jpg wd4d.jpg }

Product.all.each do |product|
  image_filenames.each do |filename|
    Image.create!(:file => File.new("#{Rails.root}/public/images/#{filename}"),
                  :product => product)
  end
end


#user

%w{admin user}.each do |name|
  User.create!(:email => "#{name}@example.com", :password => name,
               :password_confirmation => name, :remember_me => false,
               :name => name, :role => name)  
end


#***Comment***

users = User.all

Product.all.each do |product|
  parent_ids = [product.root_comment.id]
  10.times do |i|
    parent_ids << Comment.create!(:user => users.sample,
                                  :text => "Comment #{i}.\nTrololo.",
                                  :product => product,
                                  :parent_id => parent_ids.sample).id
  end
end


#PayType

["Check", "Credit card", "Purchase order"].each do |name|
  PayType.create!(:name => name)
end


#Order
pay_types = PayType.all
products = Product.all

(1..100).each do |i|
  order = Order.create!(:name => "Customer #{i}", :address => "#{i} Main Street",
                        :email => "customer-#{i}@example.com",
                        :pay_type => pay_types.sample, :user => users.sample)
  products.each do |product|
    LineItem.create!(:order => order, :price => product.price,
                     :product => product)
  end
end
