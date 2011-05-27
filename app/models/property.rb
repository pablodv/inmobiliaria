class Property < ActiveRecord::Base
	belongs_to :owner
	belongs_to :tenant
	has_many :rentals

	validates :kind, :operation, :address, :owner_id, :presence => true
	validates :rooms, :bathrooms, :price, :presence => true, :numericality => true
end
