class UserAddition < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = [:id, :user_id, :movie_url, :note1, :note2, :pay_statement_type,
                            :bonus_statement_type, :basis_break_time, :group_leader_id,
                            :education_history, :education_history_year, :graduate_school, :graduate_school_year,
                            :emergency_contact_relation, :emergency_contact_number, :tax_exemption_table, :dependent_widow,
                            :handicapped, :nearest_station, :route_to_nearest_station, :address_post_code, :address_prefecture,
                            :address_municipality, :address_house_number, :address_etc, :address_kana, :resident_post_code,
                            :resident_prefecture, :resident_municipality, :resident_house_number, :resident_etc, :resident_kana,
                            :retired_post_code, :retired_prefecture, :retired_municipality, :retired_house_number, :retired_etc, :retired_kana,
                            :spouse_name, :spouse_name_last, :spouse_name_first, :spouse_kana, :spouse_kana_last, :spouse_kana_first, :spouse_sex,
                            :spouse_birthday, :spouse_living_status, :spouse_handicapped, :spouse_health_insurance, :spouse_dependent_type,
                            :commutable_by_car, :married, :has_dependents, :sex, :birthday, :strategy,
                            :resident_tel, :retired_tel, :pharmacist_license, :pharmacist_number, :pharmacist_registered_date,
                            :ins_pharmacist_prefecture, :ins_pharmacist_number, :ins_pharmacist_registered_date, :my_cars, :retired_email, :spouse_nursing_care]

  belongs_to :user
  belongs_to :group_leader, class_name: 'User', foreign_key: :group_leader_id, optional: true

  validates :resident_post_code, presence: true, on: :update_self
  validates :resident_prefecture, presence: true, on: :update_self
  validates :resident_municipality, presence: true, on: :update_self
  validates :resident_house_number, presence: true, on: :update_self
  validates :resident_tel, presence: true, on: :update_self
  validates :retired_post_code, presence: true, on: :update_self
  validates :retired_prefecture, presence: true, on: :update_self
  validates :retired_municipality, presence: true, on: :update_self
  validates :retired_house_number, presence: true, on: :update_self
  validates :retired_tel, presence: true, on: :update_self

  enum :emergency_contact_relation, {
      spouse: 1, child: 2, parent: 3, sibling: 4, grandfather: 5, grandmother: 6, uncle: 7, aunt: 8
  }, prefix: true
  enum :tax_exemption_table, {untargeted: 0, first: 1, second: 2}, prefix: true
  enum :dependent_widow, {untargeted: 0, general: 1, special: 2}, prefix: true
  enum :handicapped, {untargeted: 0, general: 1, special: 2}, prefix: true
  enum :spouse_sex, {male: 1, female: 2}, prefix: true
  enum :spouse_living_status, {together: 1, separated: 2}, prefix: true
  enum :spouse_handicapped, {untargeted: 0, general: 1, special: 2}, prefix: true
  enum :spouse_health_insurance, {untargeted: 0, joined: 1}, prefix: true
  enum :spouse_dependent_type, {untargeted: 0, general: 1, elderly: 2}, prefix: true
  enum :spouse_nursing_care, {untargeted: 0, required: 1}, prefix: true
  enum :sex, {male: 1, female: 2}

  def address_prefecture_text
    Prefecture::prefecture_name(address_prefecture)
  end

  def resident_prefecture_text
    Prefecture::prefecture_name(resident_prefecture)
  end

  def retired_prefecture_text
    Prefecture::prefecture_name(retired_prefecture)
  end
end
