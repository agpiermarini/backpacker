class CreateDestinationImages < ActiveRecord::Migration[5.1]
  def change
    create_table :destination_images do |t|
      t.references :destination, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps null: false
    end
  end
end
