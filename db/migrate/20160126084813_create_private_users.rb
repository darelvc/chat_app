class CreatePrivateUsers < ActiveRecord::Migration
  def change
    create_table :private_users do |t|
      t.string :email
      t.belongs_to :chat, index: true

      t.timestamps null: false
    end
    add_foreign_key :private_users, :chats
  end
end