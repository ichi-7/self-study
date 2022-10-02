class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :spot_name
      t.string :caption
      t.integer :user_id
      t.timestamps
    end
  end
end
