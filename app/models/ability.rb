# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, public: true

    return unless user.present?
    can [:read, :create, :update, :destroy], Post, user:user
    can [:read, :create, :update, :destroy], Comment, user:user

    return unless user.admin?
    can :manage, Post
    can :manage, Comment
  end
end
