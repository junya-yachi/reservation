class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true
  belongs_to :reserve, optional: true

  def self.ransackable_attributes(auth_object = nil)
    %w[adress]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
