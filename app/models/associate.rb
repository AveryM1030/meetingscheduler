class Associate < ApplicationRecord
  # belong_to method specifies a one to one relationship
  # meeting options specifies that one appearance has one meeting
  belongs_to :meeting
  # participants option specifies that one appearance has one participant
  belongs_to :participant
  # validates method specifies that an appearance is valid only if
  # an actor id and movie id are present
  validates :meeting_id, :participant_id, presence: true
end