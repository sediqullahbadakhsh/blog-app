# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, public: true

    return unless user.present?
    can [:read, :update], Post, user:user
    can [:read, :update], Comment, user:user

    return unless user.admin?
    can [:read, :update], Post
    can [:read, :update], Comment
  end
end
