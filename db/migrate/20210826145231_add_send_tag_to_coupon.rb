class AddSendTagToCoupon < ActiveRecord::Migration[6.1]
  def change
    add_column :coupons, :send_at_unixtime, :integer
  end
end
