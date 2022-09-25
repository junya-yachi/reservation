class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, foreign_key: "users_id" , optional: true
  belongs_to :reserve, optional: true

  validates :name, presence: true
  validates :introduction, presence: true
  validates :rent, presence: true
  validates :adress, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[adress]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
