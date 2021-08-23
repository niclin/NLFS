class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :name
      t.string :store
      t.text :suspension
      t.text :brake
      t.text :engine
      t.text :other
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
