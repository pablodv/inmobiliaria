class Property < ActiveRecord::Base
	belongs_to :owner
	belongs_to :tenant
	has_many :rentals

	validates :kind, :operation, :address, :owner_id, :presence => true
	validates :rooms, :bathrooms, :price, :presence => true, :numericality => true

	after_save :locate

protected
	
	def locate
		location = Google::Location.find([address, "San Miguel de Tucuman", "Tucuman"].join(","))
    unless location.status == "ZERO_RESULTS"
    	Property.update_all( 
      	{:lat => location.lat, :lng => location.lng}, 
      	{:id => id}
    	)
    end
	end
end
