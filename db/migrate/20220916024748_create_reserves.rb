class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.date :start_day
      t.date :end_day
      t.integer :num_people

      t.timestamps
    end
  end
end
