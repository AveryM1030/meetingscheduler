class Meeting < ApplicationRecord
	has_many :appearances, dependent: :destroy
	has_many :hosts, through: :appearances
	validates :name, :location, :date, presence: true
end
