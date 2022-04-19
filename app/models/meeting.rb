class Meeting < ApplicationRecord
	has_many :associates
	has_many :participants, through: :associates
	validates :name, :location, :date, presence: true
end
