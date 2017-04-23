class Api::V1::CarwashSerializer < Api::V1::BaseSerializer
	
	attributes :id, :name, :address, :carwash_city_id, :carwash_city_name, :example

	def carwash_city_name
		object.city.name
	end

	def carwash_city_id
		object.city.id
	end

	def example
			object.prices.where("service_id = '1' and car_type_id = '1'").map do |price|
				Api::V1::CarwashSerializer::PriceSerializer.new(price, scope: scope, root: false, carwash: object)
			end
	end

	class PriceSerializer < Api::V1::BaseSerializer
			
		attribute :price

	end
	
end