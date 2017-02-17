class Api::V1::SessionSerializer < Api::V1::BaseSerializer
	attributes :id, :phone_number, :name, :token, :car_type #:favorites
	belongs_to :city

	has_many :favorite_carwashes



	def token
		object.authentication_token
	end

	#def favorites
	#	object.favorite_carwashes.except(:password_digest)
	#end
end