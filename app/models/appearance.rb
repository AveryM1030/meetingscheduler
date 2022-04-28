class Appearance < ApplicationRecord
  belongs_to :meeting
  belongs_to :host
  validates :meeting_id, :host_id, presence: true
end
