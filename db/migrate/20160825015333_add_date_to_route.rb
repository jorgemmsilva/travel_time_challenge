class AddDateToRoute < ActiveRecord::Migration[5.0]
    def change
        add_column :routes, :date, :datetime , default: Time.now
    end
end
