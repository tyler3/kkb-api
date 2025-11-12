module Api
  module V1
    class ShiftManagementsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        shift_managements = ShiftManagement.all
        shift_managements = shift_managements.where(updated_by_id: params[:userId]) if params[:userId].present?
        shift_managements = shift_managements.order(created_at: :desc).limit(1)
        result = shift_managements.map do |shift_management|
          file = shift_management.files.first
          {
            id: shift_management.id,
            day: shift_management.day&.strftime("%Y-%m-%d"),
            toUserName: shift_management.shift_management_members.first&.user&.name,
            categoryName: shift_management.shift_category&.name,
            comment: shift_management.comment,
            fileUrl: file.present? ? Rails.application.routes.url_helpers.rails_blob_path(shift_management.files.first) : ""
          }
        end
        render json: result.to_json
      end

      def create
        comment = params[:text].to_s.strip
        user_id = params[:userId] || User.kkb_admin&.id
        shift_management = ShiftManagement.new
        shift_management.day = Date.today
        if params[:shiftCategoryId].present?
          shift_management.shift_category_id = params[:shiftCategoryId]
        end
        shift_management.comment = comment
        shift_management.updated_by_id = user_id
        shift_management.shift_management_members.build(user_id: params[:toUserId])
        shift_management.save!
        if params[:file].present?
          shift_management.files.attach(params[:file])
        end
        render json: { status: "success", data: { id: shift_management.id } }, status: :ok
      end
    end
  end
end
