class CreatePriceData < ActiveRecord::Migration[6.0]
  def change
    create_table :price_data do |t|
      t.string :location
      t.float :average_lot
      t.float :median_lot
      t.float :low_lot
      t.float :high_lot
      t.float :pp_sqft
      t.float :under_one_acre_SP
      t.float :one_to_three_acre_SP
      t.float :adjusted_low_lot
      t.float :adjusted_high_lot

      t.timestamps
    end
  end
end
