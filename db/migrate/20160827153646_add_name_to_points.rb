class AddNameToPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :name, :string, default: "point"
  end
end
