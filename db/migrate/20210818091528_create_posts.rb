class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title, comment: "文章標題"
      t.string :store, comment: "店家、團體名稱"
      t.string :front_brake_caliper, comment: "前卡鉗"
      t.string :front_wheel_rim, comment: "前輪框"
      t.string :front_shock, comment: "前避震"
      t.string :back_brake_caliper, comment: "後卡鉗"
      t.string :back_wheel_rim, comment: "後輪框"
      t.string :back_shock, comment: "後避震"
      t.text :drive_line_system, comment: "傳動系統"
      t.text :engine_system, comment: "引擎系統"
      t.string :exhaust_pipe, comment: "排氣管"
      t.string :appearance, comment: "外觀"
      t.text :others, comment: "其他"
      t.text :comment, comment: "車主的話"
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
