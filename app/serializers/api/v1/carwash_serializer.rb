class Api::V1::CarwashSerializer < Api::V1::BaseSerializer
	
	attributes :id, :name, :address, :contacts, :phone_number, :status, :carwash_city_id, :carwash_city_name
	
	belongs_to :session
	belongs_to :user
	#belongs_to :city
	
	def carwash_city_name
		object.city.name
	end

	def carwash_city_id
		object.city.id
	end
	
end