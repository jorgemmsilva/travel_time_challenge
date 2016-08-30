class AddDurationToRoute < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :duration, :integer, default: 0
  end
end
