class AddColumnPublicToChats < ActiveRecord::Migration
  def change
    add_column :chats, :public, :boolean, default: false
  end
end
