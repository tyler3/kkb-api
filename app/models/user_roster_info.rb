class UserRosterInfo < ApplicationRecord
  belongs_to :user
  belongs_to :area, optional: true
  belongs_to :department, optional: true
  belongs_to :company, optional: true
  belongs_to :ads_mediator, class_name: 'User', foreign_key: :ads_mediator_id, optional: true
  belongs_to :shift_manager, class_name: 'User', foreign_key: :shift_manager_id, optional: true
  belongs_to :former_company, class_name: 'Company', foreign_key: :former_company_id, optional: true
  belongs_to :group_leader, class_name: 'User', foreign_key: :group_leader_id, optional: true
  belongs_to :over_time_checker, class_name: 'User', foreign_key: :over_time_checker_id, optional: true
  belongs_to :manager, class_name: 'User', foreign_key: :manager_id, optional: true

  enum :job_type, {pharmacist: 1, office_worker: 2}
  enum :table_type, {table_a: 1, table_b: 2}
  enum :employment, {formal111: 1, formal123: 2, exective: 3, parttime_normal: 4, daily_parttime: 5, contract: 6, formal73: 7,
                    advisor: 8, haken: 9, contract_no_effect: 10, contract123: 11, rehiring111: 12, rehiring123: 13,
                    daily_full: 14, daily_half: 15, formal_no_effect: 16, rehiring_no_effect: 17, freelance: 18, formal157: 19, formal208: 20,
                    contract157: 21, rehiring208: 22, rehiring157: 23}
  enum :over_time, {over_time_exist: 1, over_time_less: 2, night_over_time: 3}
  enum :course_type, {comprehensive: 1, professional: 2, local_professional: 3}

  validates :day, presence: true
  validates :user_id, presence: true
  validates :job_type, presence: true
  validates :area_id, presence: true
  # validates :employment, presence: true

  def daily?
    self.daily_parttime? || self.daily_full? || self.daily_half?
  end

  def parttime?
    self.parttime_normal? || self.daily?
  end

  def self.get_recent(day, user_id=nil)
    if user_id.present?
      span = day.is_a?(Range) ? day : day..day
      date1 = span.min.strftime('%Y-%m-%d')
      date2 = span.max.strftime('%Y-%m-%d')
      conds = []
      if date1 == date2
        conds.push("(day = recent_day)")
      else
        conds.push("(day = recent_day or day between '#{date1}' and '#{date2}')")
      end
      user_ids = user_id.is_a?(Array) ? user_id : [user_id]
      conds.push("(user_id in (#{user_ids.join(',')}))")
      sql = "select * from (select *, max(case when day <= '#{date1}' then day else null end) over (PARTITION by user_id order by day desc) as recent_day from user_roster_infos) tmp where #{conds.join(' and ')} order by day;"
      user_roster_infos = UserRosterInfo.find_by_sql(sql)
      user_roster_infos
    else
      return UserRosterInfo.none if user_ids.empty?
    end
  end

  def paid_holiday_dedline_15th?
    self.company?([:leaf, :weeds_g, :takahashi, :m_vets, :pharmacy_express, :midori])
  end

  def company?(company_code)
    if company_code.is_a?(Array)
      company_code.any?{ |code| company_id == Constants::COMPANY_ID[code&.to_sym] }
    else
      company_id == Constants::COMPANY_ID[company_code&.to_sym]
    end
  end

  def self.conv_params(params)
    params2 = params.dup
    params2.each do |key, value|
      case key
        when :job_type
          params2[key] = UserRosterInfo.job_types[value] unless value.is_a?(Integer)
        when :table_type
          params2[key] = UserRosterInfo.table_types[value] unless value.is_a?(Integer)
        when :employment
          params2[key] = UserRosterInfo.employments[value] unless value.is_a?(Integer)
        when :over_time
          params2[key] = UserRosterInfo.over_times[value] unless value.is_a?(Integer)
      end
    end
    params2
  end

  def self.find_or_dup_or_new(user_id, day)
    ur = UserRosterInfo.where(user_id: user_id).where('day <= ?', day).order(:day).last
    ur ||= UserRosterInfo.where(user_id: user_id).order(:day).first
    if ur.present?
      if ur.day != day
        ur = ur.dup
        ur.day = day
      end
    else
      ur = UserRosterInfo.new(day: day, user_id: user.id)
    end
    ur
  end
end
