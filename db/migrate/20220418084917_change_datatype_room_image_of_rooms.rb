class ChangeDatatypeRoomImageOfRooms < ActiveRecord::Migration[6.1]
  def change
    change_column :rooms, :room_image, :string
  end
end
