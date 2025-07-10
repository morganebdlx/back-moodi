class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.string :work_schedule
      t.text :interests
      t.string :commute
      t.time :wake_up_time
      t.time :sleep_time
      t.string :weather_sensitivity

      t.timestamps
    end
  end
end
