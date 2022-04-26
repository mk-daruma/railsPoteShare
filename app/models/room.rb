class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations

    validates :name, presence: true
    validates :introduction, length: { in: 10..30 } , presence: true
    validates :price, numericality: true, presence: true
    validates :address, presence: true
    validates :room_image, presence: true

    mount_uploader :room_image, RoomImageUploader
end
