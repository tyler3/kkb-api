module Api
  module V1
    class KkbsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def create_instruction
        kkb_category = KkbCategory.find_by(code: :general)
        title = "指示 #{Time.now.strftime("%Y/%m/%d %H:%M")}"
        comment = params[:text].to_s.strip
        user_id = params[:userId] || User.kkb_admin&.id
        kkb = Kkb.create!(kkb_type: :bbs, title: title, user_id: user_id, kkb_category_id: kkb_category&.id,
                          status: :active, openness: false, excepted: false, comment: comment)
        if params[:file].present?
          kkb.files.attach(params[:file])
        end
        if params[:toUserId].present?
          kkb.kkb_members.create!(user_id: params[:toUserId], member_type: :charge)
        end
        kkb.update_dests!
        kkb.update_confirms_all
        render json: { status: "success", message: "保存しました" }, status: :ok
      end
    end
  end
end
