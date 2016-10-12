class Api::V1::SessionSerializer < Api::V1::BaseSerializer
	attributes :id, :phone_number, :name, :token, :city, :car_type

	def token
		object.authentication_token
	end
end