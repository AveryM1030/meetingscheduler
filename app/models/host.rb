class Host < ApplicationRecord
	# validates method specifices that an host is valid only if
	# a fullname and email are present
	validates :fullname, :email, presence: true
end
