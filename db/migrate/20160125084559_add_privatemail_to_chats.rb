class AddPrivatemailToChats < ActiveRecord::Migration
  def change
    add_column :chats, :privatemail, :string
  end
end
