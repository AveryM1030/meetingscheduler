class Associate < ApplicationRecord
   # belong_to method specifies a one to one relationship
  # meeting options specifies that one assoicate has one meeting
  belongs_to :meeting
  # participant option specifies that one associate has one participant
  belongs_to :participant
  # validates method specifies that an assoicate is valid only if
  # an meeting id and participant id are present
  validates :meeting_id, :participant_id, presence: true
end
