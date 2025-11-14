module Api
  module V1
    class UnitTasksController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        unit_tasks = UnitTask.all
        unit_tasks = unit_tasks.where(created_by_id: params[:userId]) if params[:userId].present?
        unit_tasks = unit_tasks.order(created_at: :desc).limit(50)
        result = unit_tasks.map do |unit_task|
          file = unit_task.movie_file
          {
            id: unit_task.id,
            day: unit_task.occurrence_date&.strftime("%Y-%m-%d"),
            orgName: unit_task.to_organization_unit&.name,
            taskName: unit_task.task_name,
            content: unit_task.content,
            fileUrl: file&.attached? ? Rails.application.routes.url_helpers.rails_blob_path(unit_task.movie_file, only_path: true, disposition: :inline) : ""
          }
        end
        render json: result.to_json
      end

      def create
        task_name = params[:taskName].to_s.strip
        content = params[:content].to_s.strip
        to_organization_unit_id = params[:orgId].to_i
        unit_task = UnitTask.new
        unit_task.occurrence_date = Date.today
        unit_task.task_name = task_name
        unit_task.content = content
        unit_task.to_organization_unit_id = to_organization_unit_id
        unit_task.created_by_id = params[:userId]
        unit_task.save!
        if params[:file].present?
          unit_task.movie_file.attach(params[:file])
        end
        render json: { status: "success", data: { id: unit_task.id } }, status: :ok
      end
    end
  end
end
