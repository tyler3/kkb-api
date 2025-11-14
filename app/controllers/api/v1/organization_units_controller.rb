module Api
  module V1
    class OrganizationUnitsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        organization_units = OrganizationUnit.where(hidden: false).hierarchical_all
        result = organization_units.map { |unit| { id: unit.id, name: unit.name_with_code } }
        render json: result.to_json
      end
    end
  end
end
