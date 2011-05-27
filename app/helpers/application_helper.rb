module ApplicationHelper
	def owner?
		controller_name == 'owners' ? 'active' : ''
	end

	def tenant?
		controller_name == 'tenants' ? 'active' : ''
	end

	def property?
		controller_name == 'properties' ? 'active' : ''
	end

	def rent?
		controller_name == 'rents' ? 'active' : ''
	end
end
