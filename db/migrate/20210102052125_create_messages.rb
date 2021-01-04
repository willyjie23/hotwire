class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :message
      t.string :user
      t.integer :room_id

      t.timestamps
    end
  end
end
