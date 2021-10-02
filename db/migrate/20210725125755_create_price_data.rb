class CreatePriceData < ActiveRecord::Migration[6.0]
  def change
    create_table :price_data do |t|
      t.string :location
      t.string :adjusted_low_lot
      t.string :adjusted_high_lot

      t.timestamps
    end
  end
end
