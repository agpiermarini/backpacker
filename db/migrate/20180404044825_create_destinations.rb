class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.string :title
      t.text :notes
      t.references :country, foreign_key: true

      t.timestamps null: false
    end
  end
end
