class Api::UsersController < ApplicationController
  class Api::UsersController < ApplicationController
    def index
      @users = User.all
      render json: @users, each_serializer: UserSerializer
    end
  end
end
