class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :full_name
      t.string :telephone
      t.string :address
      t.string :identification

      t.timestamps
    end
  end
end
