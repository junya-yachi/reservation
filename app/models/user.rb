class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :rooms
  has_many :reserves

  validates :name, presence: true
  validates :email, presence: true
  validates :image, presence: true
  validates :self_intro, length: {maximum:100}

  mount_uploader :image, ImageUploader
  attr_accessor :current_password
end
