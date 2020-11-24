# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.permission?
      can :access, :rails_admin
      can :manage, :all
    end
  end
end
