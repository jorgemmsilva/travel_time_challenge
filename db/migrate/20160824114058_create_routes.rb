class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.references :negotiator, index: true, foreign_key: true
      t.timestamps
    end
  end
end
