class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :user_id
      t.integer :genre_id
      t.integer :category_id
      t.string :name, null: false
      t.string :daytime, null: false
      t.string :place, null: false
      t.string :address, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
