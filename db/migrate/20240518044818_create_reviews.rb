class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.float :rate
      t.integer :day, null: false
      t.integer :time, null: false
      t.integer :congestion, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
