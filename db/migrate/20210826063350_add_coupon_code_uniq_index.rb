class AddCouponCodeUniqIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :coupons, :code, unique: true
  end
end
