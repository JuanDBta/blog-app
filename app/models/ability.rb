class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # Guest user (not logged in)
  
      if user.role == "admin"
        can :manage, :all # Admins can manage all resources
      else
        can :destroy, Post, author_id: user.id # Users can delete their own posts
        can :destroy, Comment, user_id: user.id # Users can delete their own comments
      end
    end
  end
  