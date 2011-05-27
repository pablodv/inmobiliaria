class Person < ActiveRecord::Base
	validates :first_name, :second_name, :address, :presence => true
	validates :dni, :presence => true, :uniqueness => true, :numericality => true
	validates :email, :uniqueness => true, 
		:format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }  

	def full_name
		"#{first_name} #{second_name}"
	end
end
