class AddPostMotoType < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :moto_type, :string
  end
end
