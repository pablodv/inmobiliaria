require 'open-uri'
require 'json'
require 'rack/utils'
require 'digest/md5'

module Google
  class Location
    URL = "http://maps.googleapis.com/maps/api/geocode/json?address=%s&sensor=false".freeze

    attr_reader :address, :status, :lat, :lng

    def self.find(address)
      unless location = Rails.cache.read(cache_key(address))
        data = open(URL % Rack::Utils.escape(address))
        json = JSON.parse(data.read, :symbolize_names => true)
        location = new(json)

        # cache both entered address and google full address to reduce queries
        Rails.cache.write(cache_key(address), location)
        Rails.cache.write(cache_key(location.address), location)
      end
      location
    end

  private
    def initialize(json)
      process_record(json[:results].first)
    end

    def process_record(record)
      @status = "ZERO_RESULTS"
      if record.blank?
        @address = ""
      else
        @address = record[:formatted_address]
        if record[:types] == ["street_address"]
          @status = "OK"
          @lat = record[:geometry][:location][:lat]
          @lng = record[:geometry][:location][:lng]
        end
      end
    end

    def self.cache_key(address)
      ['googleapis', 'maps', 'v3', 'v1', Digest::MD5.hexdigest(address)].join('/')
    end
  end
end
