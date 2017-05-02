class Api::V1::TodaySerializer < Api::V1::BaseSerializer
	attributes :boxes

	def boxes
		object.boxes.where(online: "t").map do |box|
				Api::V1::TodaySerializer::BoxSerializer.new(box, scope: scope, root: false, carwash: object)
		end
	end

	class BoxSerializer < Api::V1::BaseSerializer
		attributes :id, :orders, :offorders

		def orders
			object.orders.where("status = '1' and date(start_time) = ?",Date.today).map do |order|
				Api::V1::TodaySerializer::BoxSerializer::OrderSerializer.new(order, scope: scope, root: false, box: object)
			end
		end

		class OrderSerializer < Api::V1::BaseSerializer
			attributes :id, :start_time, :end_time
		end

		def offorders
			object.offorders.where("status = 't' and date(start_time) = ?",Date.today).map do |offorder|
				Api::V1::TodaySerializer::BoxSerializer::OfforderSerializer.new(offorder, scope: scope, root: false, box: object)
			end
		end

		class OfforderSerializer < Api::V1::BaseSerializer
			attributes :id, :start_time, :end_time
		end

	end

end
