class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|

      t.text :lat
      t.text :lon

      t.float :distance 			, default: 0
      t.integer :visit_duration	, default: 0

      t.integer :position

      t.references :route, index: true, foreign_key: true
      t.timestamps
    end
  end
end
