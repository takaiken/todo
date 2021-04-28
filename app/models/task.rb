class Task < ApplicationRecord
	belongs_to :user, optional: true
	has_many :tasks, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user
	mount_uploader :image, ImageUploader

  def self.search(index)
    return Sumple.all() unless search
    Sumple.where('title LIKE(?)', "%#{index}%")
  end
end
