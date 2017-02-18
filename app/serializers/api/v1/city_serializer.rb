class Api::V1::CitySerializer < Api::V1::BaseSerializer
	
	attributes :id, :name, :status, :city_carwash_name
	#has_many :carwashes, serializer: Api::V1::CarwashcSerializer


	def city_carwash_name
		object.carwashes.map do |carwash|
			Api::V1::CarwashSerializer.new(carwash, scope: scope, root: false, city: object)
		end
	end

end