class CreateThoughts < ActiveRecord::Migration[5.1]
  def change
    create_table :thoughts do |t|
      t.string :title
      t.string :content
      t.integer :likes
      t.integer :views
      t.integer :user_id

      t.timestamps
    end
  end
end
