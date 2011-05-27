class Rent < ActiveRecord::Base
	belongs_to :property
	belongs_to :owner
	belongs_to :tenant

	validates :property_id, :owner_id, :tenant_id, :start_date, :end_date, :presence => true
end
