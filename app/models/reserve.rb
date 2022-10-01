class Reserve < ApplicationRecord
  belongs_to :room

  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :num_people, presence: true
  validate  :start_end_check

  def start_end_check
    return unless start_day? && end_day?
    if !end_day.after?(start_day)
      errors.add(:end_day, "は開始日より前の日付は登録出来ません")
    end
  end
end
