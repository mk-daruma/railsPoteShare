class Reservation < ApplicationRecord
    belongs_to :room
    # belongs_to :user

    validates :reservation_start_day, presence: true
    validates :reservation_end_day, presence: true
    validates :people, presence: true,numericality: { only_integer: true , greater_than: 1 }
    validate :start_finish_check
    validate :start_check

    def start_finish_check
      errors.add(:reservation_end_day, "は開始時刻より遅い時間を選択してください") if self.reservation_start_day > self.reservation_end_day
    end
    
    def start_check
      errors.add(:reservation_start_day, "は現在の日時より遅い時間を選択してください") if self.reservation_start_day < Time.now
    end
  
end