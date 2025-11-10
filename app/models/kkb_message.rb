require "aws-sdk-s3"

class KkbMessage < ApplicationRecord
  belongs_to :user
  belongs_to :kkb
  belongs_to :source, class_name: "User", foreign_key: :source_id
  belongs_to :src_group, class_name: "Group", foreign_key: :src_group_id, optional: true
  belongs_to :destination, class_name: "User", foreign_key: :destination_id, optional: true
  belongs_to :dest_group, class_name: "Group", foreign_key: :dest_group_id, optional: true
  belongs_to :sekisyo, class_name: "User", foreign_key: :sekisyo_id, optional: true
  has_one :kkb_sekisyo_check, as: :resource, dependent: :destroy

  enum :status, { denial: 0, waiting: 1, active: 2 }

  attr_accessor :src_user_or_group
  attr_accessor :dest_user_or_group

  before_save :set_destination, :set_source

  AWS_PRESIGNER =
    Aws::S3::Presigner.new(
      client:
        Aws::S3::Client.new(
          region: "ap-northeast-1",
          access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
          secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
        ),
    )

  def set_source
    if src_user_or_group && src_user_or_group&.size > 1
      dest_id = src_user_or_group[1..-1]
      if src_user_or_group[0] == "u"
        self.source_id = dest_id
      elsif src_user_or_group[0] == "g"
        self.src_group_id = dest_id
      end
    end
  end

  def set_destination
    if dest_user_or_group && dest_user_or_group&.size > 1
      dest_id = dest_user_or_group[1..-1]
      if dest_user_or_group[0] == "u"
        self.destination_id = dest_id
      elsif dest_user_or_group[0] == "g"
        self.dest_group_id = dest_id
      end
    end
  end

  def file_url
    return nil if self.code.blank? || self.file.blank?
    url =
      KkbMessage::AWS_PRESIGNER.presigned_url(
        :get_object,
        bucket: "kkb-s3",
        key: "uploads/kkb_message/file/#{self.code}/#{self.file}",
      )
    url
  end
end
