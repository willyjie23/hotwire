class Message < ApplicationRecord
  has_one :room

  after_create_commit { broadcast_prepend_to "messages" }
  after_update_commit { broadcast_replace_to "messages" }
  after_destroy_commit { broadcast_remove_to "messages" }

  validates :user, presence: true
  validates :message, presence: true
end
