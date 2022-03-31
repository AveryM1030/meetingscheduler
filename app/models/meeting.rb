class Meeting < ApplicationRecord
	validates :name, :location, :date, presence: true
end
