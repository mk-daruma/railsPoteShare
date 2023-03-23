class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :room_id
      # t.integer :user_id
      t.integer :total_price
      t.date :reservation_start_day
      t.date :reservation_end_day

      t.timestamps
    end
  end
end
