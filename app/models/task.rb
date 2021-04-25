class Task < ApplicationRecord
	belongs_to :user, optional: true
	mount_uploader :image, ImageUploader


  def self.search(index)
    return Sumple.all() unless search
    Sumple.where('title LIKE(?)', "%#{index}%")
  end
end
