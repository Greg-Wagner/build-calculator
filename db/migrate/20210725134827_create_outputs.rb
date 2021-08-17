class CreateOutputs < ActiveRecord::Migration[6.0]
  def change
    create_table :outputs do |t|

      t.string :client_name
      t.float :sqft
      t.string :location1
      t.string :location2
      t.string :location3
      t.float :location1_min
      t.float :location2_min
      t.float :location3_min
      t.float :location1_min_override
      t.float :location2_min_override
      t.float :location3_min_override
      t.float :location1_max
      t.float :location2_max
      t.float :location3_max
      t.float :location1_max_override
      t.float :location2_max_override
      t.float :location3_max_override
      t.float :total_range_min
      t.float :total_range_max
      t.float :build_estimate_min
      t.float :build_estimate_max
      t.text :hcl
      t.float :total_cost_min
      t.float :total_cost_max

      t.timestamps
    end
  end
end
