# frozen_string_literal: true

class SupermarketAddressSerializer
  include FastJsonapi::ObjectSerializer
  attributes :lat, :lng, :street_number, :street_name, :neighborhood, :city, :state, :zip, :country
end
