class CreateOutputs < ActiveRecord::Migration[6.0]
  def change
    create_table :outputs do |t|

      t.string :client_name
      t.float :sqft
      t.string :location1
      t.string :location2
      t.string :location3
      t.string :location1_min
      t.string :location2_min
      t.string :location3_min
      t.string :location1_min_override
      t.string :location2_min_override
      t.string :location3_min_override
      t.string :location1_max
      t.string :location2_max
      t.string :location3_max
      t.string :location1_max_override
      t.string :location2_max_override
      t.string :location3_max_override
      t.string :total_range_min
      t.string :total_range_max
      t.string :build_estimate_min
      t.string :build_estimate_max
      t.integer :hcl
      t.string :total_cost_min
      t.string :total_cost_max

      t.timestamps
    end
  end
end
