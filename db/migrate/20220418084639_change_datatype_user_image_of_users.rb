class ChangeDatatypeUserImageOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :user_image, :string
  end
end
