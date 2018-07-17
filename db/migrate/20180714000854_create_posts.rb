class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :contact, null: false

      t.belongs_to :category, null: false
      t.timestamps
    end
  end
end
