class CreateResorts < ActiveRecord::Migration[8.0]
  def change
    create_table :resorts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :description

      t.timestamps
    end
  end
end
