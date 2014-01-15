class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :text
      t.integer :message_id
      t.integer :user_id
      t.datetime :date
      t.string :category
      t.integer :dislikes
      t.string :permalink

      t.timestamps
    end
  end
end
