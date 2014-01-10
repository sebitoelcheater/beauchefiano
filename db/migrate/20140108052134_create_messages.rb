class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :text
      t.integer :father
      t.integer :user
      t.integer :minus_one
      t.integer :number_answer

      t.timestamps
    end
  end
end
