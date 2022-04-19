class Appearance < ApplicationRecord
  belongs_to :meeting
  belongs_to :host
end
