class Host < ApplicationRecord
	has_many :appearances, dependent: :destroy
	has_many :meetings, through: :appearances
	# validates method specifices that an host is valid only if
	# a fullname and email are present
	validates :fullname, :email, presence: true
end
