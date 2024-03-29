class Api::V1::CitySerializer < Api::V1::BaseSerializer
	
	attributes :name, :city_carwashes
	#has_many :carwashes, serializer: Api::V1::CarwashcSerializer

	def city_id
		object.id
	end

	def city_name
		object.name
	end


#
##
	def city_carwashes
		object.carwashes.map do |carwash|
			Api::V1::CitySerializer::CarwashSerializer.new(carwash, scope: scope, root: false, city: object)
		end
	end

	class CarwashSerializer < Api::V1::BaseSerializer
		attributes :id, :name, :address, :carwash_city_id, :carwash_city_name, :example
	
		#belongs_to :session
		#belongs_to :user
		#belongs_to :city

		def carwash_city_name
			object.city.name
		end

		def carwash_city_id
			object.city.id
		end

		def example
			object.prices.where("service_id = '1' and car_type_id = '1'").map do |price|
				Api::V1::CitySerializer::CarwashSerializer::PriceSerializer.new(price, scope: scope, root: false, carwash: object)
			end
		end

		class PriceSerializer < Api::V1::BaseSerializer
			attribute :price
			
			def lowest
				if KS_for_1?
					object.price
				else
					return
				end
			end

			def KS_for_1?
				object.service_id == 1 && object.car_type_id == 1
			end


		end

	end
end