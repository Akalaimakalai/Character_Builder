# frozen_string_literal: true

class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    @user.nil? ? guest_abilities : user_abilities
  end

  private

  def guest_abilities
    cannot :manage, :all
  end

  def user_abilities
    can :read, Character, user_id: user.id
    can :create, Character
    can :destroy, Character, user_id: user.id
  end
end
