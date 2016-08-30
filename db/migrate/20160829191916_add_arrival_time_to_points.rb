class AddArrivalTimeToPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :arrival_time, :datetime
  end
end
