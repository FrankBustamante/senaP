class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.references :product_line, foreign_key: true
      t.integer :quantity
      t.float :price
      t.references :branch_office, foreign_key: true
      t.string :adjunto

      t.timestamps
    end
  end
end
