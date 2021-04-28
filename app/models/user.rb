class User < ApplicationRecord
  
  has_many :tasks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tasks, through: :likes, source: :task
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def already_liked?(task)
    self.likes.exists?(task_id: task.id)
  end

  def self.guest
  	find_or_create_by!(email: 'guest@example.com') do |user|
  		user.password = SecureRandom.urlsafe_base64
  	end
  end

end
