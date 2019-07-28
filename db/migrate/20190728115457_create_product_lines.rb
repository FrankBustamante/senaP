class CreateProductLines < ActiveRecord::Migration[5.2]
  def change
    create_table :product_lines do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
