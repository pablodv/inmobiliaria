class Tenant < Person
	has_many :properties
	has_many :rentals
end