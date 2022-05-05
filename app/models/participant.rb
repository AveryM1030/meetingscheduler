class Participant < ApplicationRecord
	has_many :associates, dependent: :destroy
	has_many :meetings, through: :associates
	validates :fullname, :email, presence: true
end
