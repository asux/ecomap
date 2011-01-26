class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :show, :all
    can :create, User

    if user.admin?
      can :manage, :all
    else
      unless user.role.nil?
        can :view_map, :all
        can :manage, User, :id => user.id
        can :read, Sample

        if user.manager?
          can :update, User, :role => 'normal'
          can :manage, Sample
          #can :assign_role, User
        end
      end
    end
  end
end
