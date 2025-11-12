module Api
  module V1
    class ShiftCategoriesController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        shift_categories = ShiftCategory.where(hidden: false).order(:rank)
        result = shift_categories.map { |category| { id: category.id, name: category.name } }
        render json: result.to_json
      end
    end
  end
end
