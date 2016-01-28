class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :chats
  has_many :messages
  
  scope :online, lambda{ where("updated_at > ?", 10.minutes.ago) }
  
  def admin?
    self == User.first
  end
  
  def online?
    updated_at > 10.minutes.ago
  end
  
end
