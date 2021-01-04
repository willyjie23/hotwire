class RoomsAddName < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :name, :string
  end
end
