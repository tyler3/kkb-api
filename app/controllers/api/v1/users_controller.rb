module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        users = User.valid_users(Date.today)
        result = users.map { |user| { id: user.id, code: user.code, name: user.name } }
        render json: result.to_json
      end
    end
  end
end
