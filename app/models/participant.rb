class Participant < ApplicationRecord
	validates :fullname, :email, presence: true
end
