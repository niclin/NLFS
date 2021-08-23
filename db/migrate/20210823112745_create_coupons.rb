class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :using_state
      t.integer :user_id

      t.timestamps
    end
  end
end
