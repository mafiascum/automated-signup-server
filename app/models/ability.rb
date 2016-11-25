# CanCanCan abilities
class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    if user.admin?
      can :manage, User
    elsif user.listmod?

    end

    can :read, User
    can :reset_token, User, id: user.id
  end
end
