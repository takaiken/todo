class Task < ApplicationRecord
	belongs_to :user, optional: true
	mount_uploader :image, ImageUploader


  def self.search(search)
    return Sumple.all() unless search
    Sumple.where('title LIKE(?)', "%#{search}%")
  end
end
