class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :read, :all
    can :create, User

    if user.admin?
      can :manage, :all
    else
      unless user.role.nil?
        can :manage, User, :id => user.id

        if user.manager?
          can :update, User, :role => 'normal'
          #can :assign_role, User
        end
      end
    end
  end
end
