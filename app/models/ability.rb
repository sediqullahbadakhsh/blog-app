class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :manage, User, id: user.id
      can :manage, Post, user_id: user.id
      can :manage, Comment, user_id: user.id
    end
  end
end
