class Chat < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :private_users
    
  # Chat.private_chat
  accepts_nested_attributes_for :private_users, :reject_if => :all_blank, :allow_destroy => true
  
  def admin?
    self == User.first
  end
  
end
