class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :reserve
end
