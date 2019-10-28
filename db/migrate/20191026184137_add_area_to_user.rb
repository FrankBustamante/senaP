class AddAreaToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :area_id , :bigint, null: true
  end
end
