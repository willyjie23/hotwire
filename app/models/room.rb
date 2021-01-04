class Room < ApplicationRecord
  has_many :messages
  after_create_commit { broadcast_append_to "rooms" }
  after_update_commit { broadcast_replace_to "rooms" }
  after_destroy_commit { broadcast_remove_to "rooms" }

  validates :name, presence: true
end
