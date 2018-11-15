class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    can [:read, :create, :update], User, id: user.id
    cannot :destroy, User
    can [:read, :create], Comment, user_id: user.id
    cannot :destroy, Comment
    cannot [:create, :update, :destroy], Product

    if user.admin?
      can :manage, :all
    end

  end
end
