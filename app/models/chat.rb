class Chat < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :private_users
  
  validates :title, presence: true, length: {minimum: 5, maximum: 30}
    
  # Chat.private_chat
  accepts_nested_attributes_for :private_users, :reject_if => :all_blank, :allow_destroy => true
  
  def admin?
    self == User.first
  end
  
  def owner
  end
  
end
