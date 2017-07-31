class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.integer :category_id
      t.integer :thought_id

      t.timestamps
    end
  end
end
