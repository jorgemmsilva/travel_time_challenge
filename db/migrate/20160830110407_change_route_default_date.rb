class ChangeRouteDefaultDate < ActiveRecord::Migration[5.0]
  def change
    change_column :routes, :date, :datetime , default: Time.now.midnight
  end
end
