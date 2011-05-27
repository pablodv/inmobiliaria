class PropertiesController < InheritedResources::Base
  before_filter :authenticate_user!
end
