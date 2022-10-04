class Reserve < ApplicationRecord
  belongs_to :room

  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :num_people, presence: true
  validate  :start_end_check
  validate  :num_people_check
  validate  :start_day_check

  def start_end_check
    return unless start_day? && end_day?
    if !end_day.after?(start_day)
      errors.add(:end_day, "は開始日より前の日付は登録出来ません")
    end
  end

  def num_people_check
    if num_people <= 0
      errors.add(:num_people, "は0以下の数値で登録は出来ません")
    end
  end

  def start_day_check
    if start_day.before?(Date.today)
      errors.add(:start_day, "は本日より前の日付で登録は出来ません")
    end
  end
end
