class Api::V1::TomorrowSerializer < Api::V1::BaseSerializer
	attributes :boxes

	def boxes
		object.boxes.where("online == true").map do |box|
				Api::V1::TomorrowSerializer::BoxSerializer.new(box, scope: scope, root: false, carwash: object)
		end
	end

	class BoxSerializer < Api::V1::BaseSerializer
		attributes :id, :orders, :offorders

		def orders
			object.orders.where("status = '1' and date(start_time) == ?",DateTime.now.tomorrow.to_date).map do |order|
				Api::V1::TomorrowSerializer::BoxSerializer::OrderSerializer.new(order, scope: scope, root: false, box: object)
			end
		end

		class OrderSerializer < Api::V1::BaseSerializer
			attributes :id, :start_time, :end_time
		end

		def offorders
			object.offorders.where("status = '1' and date(start_time) == ?",DateTime.now.tomorrow.to_date).map do |offorder|
				Api::V1::TomorrowSerializer::BoxSerializer::OfforderSerializer.new(offorder, scope: scope, root: false, box: object)
			end
		end

		class OfforderSerializer < Api::V1::BaseSerializer
			attributes :id, :start_time, :end_time
		end

	end
end