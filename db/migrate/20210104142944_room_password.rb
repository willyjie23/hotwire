class RoomPassword < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :password, :string
  end
end
