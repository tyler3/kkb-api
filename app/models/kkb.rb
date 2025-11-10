class Kkb < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  belongs_to :kkb_category, optional: true
  has_many :kkb_dests, dependent: :destroy
  has_many :kkb_members, dependent: :destroy
  has_many :kkb_groups, dependent: :destroy
  has_many :groups, through: :kkb_groups
  has_many :kkb_messages, dependent: :destroy
  has_many :kkb_dests, dependent: :destroy
  has_many :kkb_confirms, dependent: :destroy
  has_many :kkb_commenters, dependent: :destroy
  has_many :attachments, dependent: :destroy
  has_many :kkb_favorites, dependent: :destroy
  has_one :kkb_sekisyo_check, as: :resource, dependent: :destroy
  has_many_attached :files

  enum :kkb_type, {
         bbs: 1,
         task: 2,
         shift_haken: 12,
         shift_haken_month: 13,
         file_list: 101,
         file_project: 102,
         check_list: 103,
         questionnaire: 111,
         misc_exp: 201,
         misc_exp_alert: 202,
         business_report: 211,
         commuting_exp: 221,
         commuting_exp_alert: 222,
         report_fixed_count: 241,
         routine_task_submit: 301,
         routine_task_check: 302,
         routine_task_confirm: 303,
         pdf_image: 10_098,
         guide: 10_099,
         rule: 10_100,
         guide_with_messages: 10_101,
         rule_with_messages: 10_102,
         priority_task: 10_200,
         shift_user: 10_220,
         shift_dest: 10_230,
         shift_users_haken: 10_400,
         shift_users_haken_month: 10_410,
         personnel_change: 10_500,
         user_edit_self: 10_600,
         recruit_pharmacist_info: 10_700,
         off_hours_report: 10_800,
         accident_report: 10_810,
         internal_history: 10_900,
         m_follow: 11_000,
         m_mail: 11_010,
         ma_header: 11_100,
         ma_header_fixed: 11_110,
         ma_header_progress: 11_120,
         department_edit_self: 11_200,
         task_report: 11_300,
         instruction: 11_400,
         time_record_summary: 11_500,
         promise: 11_600,
       }
  enum :status, { denial: 0, waiting: 1, active: 2, pending: 3, closed: 4, draft: 5 }
  enum :section, { common: 0, weeds: 1, leaf: 2, lunar: 3, adviser: 4, shop: 5, apis: 6 }

  validates :title, presence: true

  def update_dests_confirms!
    if draft? || denial? || waiting?
      kkb_dests.delete_all
      kkb_dests.create!(user_id: user_id)
      kkb_confirms.delete_all
    else
      if openness?
        # kkb_dests
        kkb_dests.delete_all
        kkb_dests.create!(user_id: nil)
        # kkb_confirm targets
        permitted_ids = self.permitted_user_ids
        valid_user_ids = User.actives(Date.today, false, true, true).pluck(:id)
        target_user_ids = (permitted_ids & valid_user_ids).uniq
      else
        # kkb_dests
        target_user_ids = uniq_member_ids(nil, true, true)
        dests_user_ids = kkb_dests.pluck(:user_id)
        kkb_dests.where(user_id: dests_user_ids - target_user_ids).delete_all
        new_dests = (target_user_ids - dests_user_ids).map { |id| { kkb_id: self.id, user_id: id } }
        KkbDest.insert_all(new_dests) if new_dests.present?
      end
      # kkb_confirms
      confirms_user_ids = kkb_confirms.pluck(:user_id)
      target_user_ids -= User.sekisyo_top_ids if self.excepted?
      # delete kkb_confirms
      kkb_confirms.where(user_id: confirms_user_ids - target_user_ids).delete_all
      # update kkb_confirms
      kkb_confirms.update_all(status: :unread)
      # insert kkb_confirms
      new_confirms =
        (target_user_ids - confirms_user_ids).map { |id| { kkb_id: self.id, user_id: id, status: :unread } }
      KkbConfirm.insert_all(new_confirms) if new_confirms.present?
    end
  end

  def permitted_user_ids(valid_sekisyo = true)
    user_ids = []
    user_ids << user_id if user_id.present?
    user_ids += group.group_users.pluck(:user_id) if group_id.present?
    unless draft?
      user_ids += User.where(user_type: :admin).pluck(:id)
      if valid_sekisyo && !member_only?
        user_ids += User.where(sekisyo: true).pluck(:id)
        if User::SEKISYO_SECTIONS.include?(section.to_sym)
          sekisyo_group = Group.find_by(code: section.to_sym)
          user_ids += sekisyo_group.group_users.pluck(:user_id) if sekisyo_group.present?
        end
      end
    end
    unless denial? && waiting?
      if openness?
        if common?
          user_ids += User.where(restrict_openness: false).pluck(:id)
        else
          user_ids += User.where(section: section.to_sym).pluck(:id)
        end
        cb_companies = Company.valid_all.where(cb: true)
        cb_users = User.with_roster_infos(Date.today, { company_id: cb_companies.pluck(:id) }, true, false)
        user_ids -= cb_users.pluck(:id)
      else
        user_ids += uniq_member_ids
      end
    end
    user_ids.uniq
  end

  def uniq_member_ids(member_type = nil, inc_author = false, inc_top_sekisyo = false, except_secret_group = false)
    member_user_ids = []
    # users
    member_users = kkb_members
    member_users = kkb_members.where(member_type: member_type) if member_type
    member_user_ids += member_users.pluck(:user_id)
    # groups
    member_groups = kkb_groups
    member_groups = member_groups.where(member_type: member_type) if member_type
    member_groups = member_groups.joins(:group).where(groups: { secret: false }) if except_secret_group
    member_group_ids = member_groups.pluck(:group_id)
    member_user_ids += GroupUser.where(group_id: member_group_ids).pluck(:user_id)
    if inc_author
      member_user_ids << user_id if user_id
      member_user_ids += group.user_ids if group_id && (!group.secret || !except_secret_group)
    end
    member_user_ids += User.sekisyo_top_ids if !excepted? && inc_top_sekisyo
    member_user_ids.uniq
  end

  def update_confirms_message(kkb_message)
    if active?
      if kkb_message.active?
        if kkb_message.destination_id || kkb_message.dest_group_id
          user_ids = []
          user_ids << kkb_message.destination_id if kkb_message.destination_id
          user_ids += kkb_message.dest_group.user_ids if kkb_message.dest_group_id
          kkb_confirms.where(user_id: user_ids).update_all(status: :unread)
        else
          except_user_ids = [kkb_message.user_id]
          except_user_ids += User.sekisyo_top_ids if excepted?
          existing_user_ids = kkb_confirms.pluck(:user_id)
          kkb_confirms.where(status: :read, user_id: (existing_user_ids - except_user_ids)).update_all(status: :unread)
        end
      end
      clean_confirms
    end
  end

  def clean_confirms
    kkb_confirms
      .group(:user_id)
      .having("count(*) >= 2")
      .each do |kkb_confirm|
        KkbConfirm
          .where(kkb_id: kkb_confirm.kkb_id, user_id: kkb_confirm.user_id)
          .order(status: :desc)
          .each_with_index do |confirm, i|
            next if i == 0
            confirm.delete
          end
      end
  end

  def delete_dests(user, group = nil, department = nil)
    unless openness?
      member_ids = uniq_member_ids(nil, true)

      user_ids = []
      user_ids << user.id if user.present?
      user_ids += group.users.map { |user| user.id } if group.present?
      user_ids += department.users.map { |user| user.id } if department.present?
      user_ids.uniq!

      kkb_dests.where(user_id: user_ids - member_ids).destroy_all
    end
  end

  def delete_confirms(user, group = nil, department = nil, forced = false)
    member_ids = uniq_member_ids(nil, true)

    user_ids = []
    user_ids << user.id if user.present?
    user_ids += group.users.map { |user| user.id } if group.present?
    user_ids += department.users.map { |user| user.id } if department.present?
    user_ids.uniq!
    user_ids = user_ids - member_ids unless forced
    kkb_confirms.where(user_id: user_ids).destroy_all
    clean_confirms
  end

  def user_name_text
    anonymous? ? "匿名" : user_name.presence || group&.name || user&.name
  end

  def update_dests!
    kkb_dests.delete_all

    if draft? || denial? || waiting?
      kkb_dests.create!(user_id: user_id)
    else
      if openness?
        kkb_dests.create!(user_id: nil)
      else
        uniq_member_ids(nil, true, true).each do |user_id|
          kkb_dests.create!(user_id: user_id)
        end
      end
    end
  end

  def update_confirms_all(except_user_id=nil, closed_update=false)
    if active? || (closed_update && closed?)
      sekisyo_top_ids = User.sekisyo_tops.pluck(:id).uniq

      except_user_ids = []
      except_user_ids << except_user_id if except_user_id.present?
      except_user_ids += sekisyo_top_ids if self.excepted? && sekisyo_top_ids.present?

      existing_user_ids = kkb_confirms.pluck(:user_id)
      kkb_confirms.where(status: :read, user_id: (existing_user_ids - except_user_ids)).update_all(status: :unread)

      valid_user_ids = User.valid_users(Date.today, false).pluck(:id)
      if openness?
        target_user_ids = ((permitted_user_ids & valid_user_ids) - existing_user_ids - except_user_ids).uniq
        target_user_ids.each do |target_user_id|
          kkb_confirms.create!(user_id: target_user_id, status: :unread)
        end
      else
        member_ids = uniq_member_ids(nil, true, true)
        kkb_confirms.where.not(user_id: member_ids & valid_user_ids).delete_all
        target_user_ids = ((member_ids & valid_user_ids) - existing_user_ids - except_user_ids).uniq
        target_user_ids.each do |target_user_id|
          kkb_confirms.create!(user_id: target_user_id, status: :unread)
        end
      end
      clean_confirms
    end
  end
end
