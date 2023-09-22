class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # Guest user (not logged in)
  
      if user.role == "admin"
        can :manage, :all # Admins can manage all resources
      else
        can :read, [Post, Comment] # Usuarios pueden leer posts y comentarios de otros
        can :manage, Post, author_id: user.id # Usuarios pueden administrar (editar, eliminar) sus propios posts
        can :manage, Comment, user_id: user.id # Usuarios pueden administrar sus propios comentarios
      end
    end
  end
  