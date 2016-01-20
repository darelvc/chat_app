class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      
      t.boolean :private, default: false
      t.string :title
      t.timestamps null: false
    end
  end
end
