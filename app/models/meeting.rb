class Meeting < ApplicationRecord
	has_many :appearances, dependent: :destroy
	has_many :hosts, through: :appearances
	has_many :associates
	has_many :participants, through: :associates
	validates :name, :location, :date, presence: true
end
