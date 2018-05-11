class CreateTripLines < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_lines do |t|
      t.integer :trip_id
      t.integer :line_id
      t.timestamps
    end
  end
end
