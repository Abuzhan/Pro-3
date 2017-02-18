class Api::V1::SessionSerializer < Api::V1::BaseSerializer
	attributes :id, :phone_number, :name, :token, :car_type_id, :car_type_name, :city_id, :city_name
	
	#belongs_to :city

	has_many :favorite_carwashes



	def token
		object.authentication_token
	end

	def car_type_id
		object.car_type.id	
	end

	def car_type_name
		object.car_type.name
	end

	def city_name
		object.city.name
	end

	def city_id
		object.city.id
	end
	#def favorites
	#	object.favorite_carwashes.except(:password_digest)
	#end
end