class CreateNegotiators < ActiveRecord::Migration[5.0]
  def change
    create_table :negotiators do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
