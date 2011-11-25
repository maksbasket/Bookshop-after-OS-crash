class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, Product
      can :read, Comment
      can :create, Order
    elsif user.role == 'admin'
      can :manage, :all
    else
      can :read, Product
      can [:create, :read], Comment
      can :create, Order
      can :read, Order, :user_id => user.id
    end
  end
end