class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :type
      t.string :description
      t.string :adjunto
      t.references :branch_office, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
