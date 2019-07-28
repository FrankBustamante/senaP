class CreateBranchOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :branch_offices do |t|
      t.references :city, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.string :telephone
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
