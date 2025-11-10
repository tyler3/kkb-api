class User < ApplicationRecord
  devise :database_authenticatable, authentication_keys: [:code]
  include DeviseTokenAuth::Concerns::User
  attr_accessor :login
  attr_accessor :station_code
  attr_accessor :station_name
  attr_accessor :enable_check_mail

  has_many :user_roster_infos, dependent: :destroy
  has_one :user_addition, dependent: :destroy
  has_many :kkb_commenters, dependent: :destroy
  has_one_attached :profile_picture

  enum :sex, { male: 1, female: 2 }
  enum :user_type, { normal: 1, super_user: 5, restricted: 10, admin: 100 }
  enum :section, { common: 0, weeds: 1, leaf: 2, lunar: 3, adviser: 4, apis: 6, shop: 100 }
  enum :expense_section, { expense_none: 0, expense_weeds: 1, expense_leaf: 2, expense_lunar: 3 }
  enum :job_desc, { nutritionist: 1 }
  enum :entry_type, { unknown: 0, new_graduate: 1, mid_career: 2, m_and_a: 3 }
  enum :commutable_by_car, { no_license: 0, available_car: 1, no_driving: 2, no_car: 3 }

  SEKISYO_SECTIONS = %i[leaf lunar]

  def get_user_roster_info(day)
    UserRosterInfo.get_recent(day, self.id).last
  end
  
  def profile_picture_path
    Rails.application.routes.url_helpers.rails_blob_path(profile_picture) if profile_picture.present?
  end

  def profile_movie_url
    self.user_addition&.movie_url
  end

  def self.actives(span, except_shop, check_min_day, check_max_day, check_count_day = false)
    users = User.where(hidden: false)
    users = users.where.not(section: :shop) if except_shop
    users =
      users.valid_span(
        span,
        check_min_day,
        check_min_day,
        check_min_day && check_count_day,
        check_max_day,
        check_max_day,
        check_max_day && check_count_day,
      )
    users
  end

  def self.search(term)
    users = User.all
    term = term.strip
    if term =~ /^[0-9a-zA-Z$]+$/
      users = users.where("code LIKE ?", "%" + term + "%")
    elsif term =~ /^[\p{Hiragana}\p{Katakana}]+$/
      term = term.tr("ぁ-ん", "ァ-ン")
      users =
        users.where(
          'concat(ifnull(kana1, ""), ifnull(kana2, "")) LIKE ? or concat(ifnull(former_kana, ""), ifnull(kana2, "")) LIKE ?',
          "%" + term + "%",
          "%" + term + "%",
        )
    elsif term
      users =
        users.where(
          'concat(ifnull(name1, ""), ifnull(name2, "")) LIKE ? or concat(ifnull(former_name, ""), ifnull(name2, "")) LIKE ?',
          "%" + term + "%",
          "%" + term + "%",
        )
    end
    users
  end

  # span: Date or Range
  def self.valid_span(
    span,
    check_entry_date,
    check_start_date,
    check_start_day_count,
    check_retire_date,
    check_final_date,
    check_finish_day_count
  )
    if span.is_a?(Range)
      day1 = span.min
      day2 = span.max
    else
      day1 = day2 = span
    end
    users = User.all
    users = users.where("entry_date is null or entry_date <= ?", day2) if check_entry_date
    users = users.where("start_date is null or start_date <= ?", day2) if check_start_date
    users = users.where("start_day_count is null or start_day_count <= ?", day2) if check_start_day_count
    users = users.where("retire_date is null or retire_date >= ?", day1) if check_retire_date
    users = users.where("final_date is null or final_date >= ?", day1) if check_final_date
    users = users.where("finish_day_count is null or finish_day_count >= ?", day1) if check_finish_day_count
    users
  end

  def valid_span?(
    span,
    check_entry_date,
    check_start_date,
    check_start_day_count,
    check_retire_date,
    check_final_date,
    check_finish_day_count
  )
    if span.is_a?(Range)
      day1 = span.min
      day2 = span.max
    else
      day1 = day2 = span
    end
    if check_entry_date
      return false if entry_date && entry_date > day2
    end
    if check_start_date
      return false if start_date && start_date > day2
    end
    if check_start_day_count
      return false if start_day_count && start_day_count > day2
    end
    if check_retire_date
      return false if retire_date && retire_date < day1
    end
    if check_final_date
      return false if final_date && final_date < day1
    end
    if check_finish_day_count
      return false if finish_day_count && finish_day_count < day1
    end
    true
  end

  def self.eq_sql(tbl, column, value)
    colname = [ tbl, column ].join(".")
    if value.is_a?(Array)
      "(#{colname} in (#{value.to_a.join(",")}))"
    elsif value.is_a?(Range)
      "(#{colname} between #{value.min} and #{value.max})"
    else
      value.nil? ? "(#{colname} is null)" : "(#{colname} = #{value})"
    end
  end

  def self.with_roster_infos(day, uri_params, eager_load = true)
    span = day.is_a?(Range) ? day : day..day
    day1 = span.min
    day2 = span.max
    if eager_load
      users = all.eager_load(:user_roster_infos)
    else
      users = all.left_outer_joins(:user_roster_infos)
    end
    if day1 == day2
      users =
        users.where(
          "user_roster_infos.day = (select max(uri.day) from user_roster_infos uri where uri.user_id=users.id and uri.day <= ?)",
          day1,
        )
    else
      users =
        users.where(
          "user_roster_infos.day between ifnull((select max(uri.day) from user_roster_infos uri where uri.user_id=users.id and uri.day <= ?),?) and ?",
          day1,
          day1,
          day2,
        )
    end
    users = users.where(user_roster_infos: uri_params) if uri_params.present?
    users
  end

  def self.sekisyo_top
    user_code = GlobalValue.find_by(code: "sekisyo_top")
    User.find_by(code: user_code.try(:value)) if user_code.present?
  end

  def self.sekisyo_top_ids
    user_ids = []

    user = self.sekisyo_top
    user_ids << user.id if user.present?

    sekisyo_group = Group.find_by(code: :sekisyo_top)
    user_ids += sekisyo_group.group_users.pluck(:user_id) if sekisyo_group.present?

    user_ids.uniq
  end

  def name
    name1.to_s + " " + name2.to_s
  end

  def kana
    kana1.to_s + " " + kana2.to_s
  end

  def name_with_code
    name.to_s + " (" + code.to_s + ")"
  end

  def name_with_employment(day)
    uri = UserRosterInfo.get_recent(day, self.id).last
    if uri && uri.employment
      name.to_s + " " + uri.employment_text
    else
      name.to_s
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where([ "lower(code) = :value OR lower(email) = :value", { value: login.downcase } ]).first
    else
      where(conditions).first
    end
  end

  def location_station_name
    location_station&.name
  end

  def self.kkb_admin
    User.find_by(code: :admin)
  end

  def sync_count_day(update=false)
    modified = false
    if self.entry_date.present? && (self.start_day_count.blank? || self.start_day_count < self.entry_date)
      self.start_day_count = self.entry_date
      modified = true
    end
    if self.start_date.present? && (self.start_day_count.blank? || self.start_day_count < self.start_date)
      self.start_day_count = self.start_date
      modified = true
    end
    if self.retire_date.present? && (self.finish_day_count.blank? || self.finish_day_count > self.retire_date)
      self.finish_day_count = self.retire_date
      modified = true
    end
    if self.final_date.present? && (self.finish_day_count.blank? || self.finish_day_count > self.final_date)
      self.finish_day_count = self.final_date
      modified = true
    end
    save! if update
    modified
  end

  def e_member?(date=nil)
    date ||= Date.today
    get_user_roster_info(date)&.company&.e_member?
  end

  def self.sekisyo_top
    user_code = GlobalValue.find_by(code: 'sekisyo_top')
    User.find_by(code: user_code.try(:value)) if user_code.present?
  end

  def self.sekisyo_tops
    users = []

    user = self.sekisyo_top
    users << user if user.present?

    sekisyo_group = Group.find_by(code: :sekisyo_top)
    users += sekisyo_group.users.to_a if sekisyo_group.present?

    users
  end

  def self.valid_users(day=nil, except_shop=true, check_entry_date=true, check_start_date=true, check_final_date=true, check_retire_date=true)
    day ||= Date.today
    users = self.where(hidden: false)
    if check_entry_date
      users = users.where('entry_date is null or entry_date <= ?', day)
    end
    if check_start_date
      users = users.where('start_date is null or start_date <= ?', day)
    end
    if check_final_date
      users = users.where('final_date is null or final_date >= ?', day)
    end
    if check_retire_date
      users = users.where('retire_date is null or retire_date >= ?', day)
    end
    users = users.where.not(section: :shop) if except_shop
    users
  end
end
