class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :read, :all
    can :create, User

    if user.admin?
      can :manage, :all
    else
      if user.normal?
        can :manage, User, :id => user.id
      end
    end
  end
end
