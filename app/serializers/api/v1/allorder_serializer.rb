class Api::V1::AllorderSerializer < Api::V1::BaseSerializer
	attributes :id, :carwash_address, :carwash_name, :service_name, :car_type, :price, :status, :start_time, :end_time, :created_at

	def user_id
		object.user.id
	end

	def user_name
		object.user.name
	end		

	def box_id
		object.box.id
	end

	def carwash_id
		object.box.carwash.id
	end

	def carwash_address
		object.box.carwash.address
	end

	def carwash_name
		object.box.carwash.name
	end

	def service_name
		object.price.service.name
	end

	def car_type
		object.price.car_type.name
	end

	def price_id
		object.price.id
	end

	def price
		object.price.price
	end
	
end