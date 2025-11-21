class UnitTask < ApplicationRecord
  attr_accessor :allow_blank_to_organization_unit
  enum :status, {
    waiting: 1,
    finished: 2,
    progress_check: 3,
    completed: 4,
    urging: 5,
    commented: 6,
    replied: 7,
    submitted: 8,
    checking: 9,
    instruction_sending: 10
  }
 
  belongs_to :from_organization_unit, class_name: 'OrganizationUnit', optional: true
  belongs_to :to_organization_unit, class_name: 'OrganizationUnit', optional: true
  has_one_attached :movie_file
  
  validates :occurrence_date, presence: true
  validates :task_name, presence: true
  validates :to_organization_unit, presence: true, unless: :allow_blank_to_organization_unit?
  validates :kkb_board_number, numericality: { only_integer: true }, allow_nil: true
  
  before_create :generate_unique_code
  before_update :update_task_code_prefix

  def status_text
    I18n.t("activerecord.enums.unit_task.status.#{status}")
  end

  private

  def allow_blank_to_organization_unit?
    !!@allow_blank_to_organization_unit
  end

  def generate_unique_code
    return if code.present? # 既にcodeが設定されている場合はスキップ（CSV等で指定されたcodeを保持）

    # 408, 409, 410, 411... という単純な連番で採番
    # 既存の最大コード番号を取得（数値として比較）
    max_code = UnitTask.where("code REGEXP '^[0-9]+$'").maximum("CAST(code AS UNSIGNED)")

    if max_code.nil? || max_code == 0
      # データが存在しない場合は408から開始
      self.code = "408"
    else
      # 最大値 + 1
      self.code = (max_code + 1).to_s
    end
  end

  def update_task_code_prefix
    # 自動採番ロジック（408, 409, 410...）では、
    # 組織変更時のコード更新は不要なため、このメソッドは無効化
    return
  end
end
