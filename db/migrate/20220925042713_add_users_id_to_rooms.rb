class AddUsersIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :users_id, :integer
  end
end
