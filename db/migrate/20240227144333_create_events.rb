class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, limit: 20
      t.date :start_date
      t.date :end_date
      t.boolean :is_all_day
      t.string :memo, limit: 500

      t.timestamps
    end
  end
end
