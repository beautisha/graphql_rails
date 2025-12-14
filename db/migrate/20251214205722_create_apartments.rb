class CreateApartments < ActiveRecord::Migration[8.0]
  def change
    create_table :apartments do |t|
      t.string :room_type
      t.text :description
      t.references :resort, null: false, foreign_key: true

      t.timestamps
    end
  end
end
