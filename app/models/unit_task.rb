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
    return unless to_organization_unit # ガード節を追加

    organization_unit = to_organization_unit
    count = organization_unit.task_count + 1
    self.code = "#{organization_unit.symbol}#{count}"

    # タスクカウントを更新
    organization_unit.update(task_count: count)
  end

  def update_task_code_prefix
    return unless to_organization_unit
    return unless code.present? # コードが存在する場合のみ更新

    # 現在のコードから数値部分を抽出（末尾の数値）
    current_number = code.match(/\d+$/)
    return unless current_number # 数値部分がなければ何もしない

    self.code = "#{to_organization_unit.symbol}#{current_number[0]}"
  end
end
