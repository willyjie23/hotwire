class RoomHasMany < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :message_id, :integer
  end
end
