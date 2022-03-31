class Host < ApplicationRecord
	# has_many method specifies a one to many relationship
	# appearances option specifies that one host has many appearances
	# destroy causes all appearance to be destroyed when their
	# related host is destroyed
	has_many :appearances, dependent: :destroy
	# movies option specifies that one actor has many host
	# the through option specifies tht the relationship exists
	# only through appearances
	has_many :movies, through: :appearances
	# validates method specifices that an actor is valid only if
	# a first name and last name are present
	validates :fullname, :email, presence: true
end
