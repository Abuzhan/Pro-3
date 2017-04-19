class Api::V1::OrderSerializer < Api::V1::BaseSerializer
	attributes :id, :user_id, :user_name, :carwash_id, :carwash_name, :box_id, :price_id, :price, :status, :start_time, :end_time

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

	def carwash_name
		object.box.carwash.name
	end

	def price_id
		object.price.id
	end

	def price
		object.price.price
	end
end