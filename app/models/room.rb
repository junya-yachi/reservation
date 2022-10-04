class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, foreign_key: "users_id" , optional: true
  belongs_to :reserve, optional: true

  validates :name, presence: true
  validates :introduction, presence: true
  validates :rent, presence: true
  validates :adress, presence: true
  validate  :rent_check

  def self.ransackable_attributes(auth_object = nil)
    %w[adress introduction]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[]
  end

  def rent_check
    if rent < 0
      errors.add(:rent, "は0より少ない数値で登録は出来ません")
    end
  end
end
