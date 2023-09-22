class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # Guest user (not logged in)
  
      if user.role == "admin"
        can :manage, :all # Admins can manage all resources
      else
        can :read, :all # Usuarios pueden leer posts y comentarios de otros
        can :create, [Post, Comment]
        can :destroy, Post, author_id: user.id
        can :destroy, Comment, user_id: user.id
      end
    end
  end
  