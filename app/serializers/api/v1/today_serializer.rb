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
=begin
			object.orders.where("status = '1' and date(start_time) = ?",Date.today).map do |order|
				if order.end_time.to_i > Time.now.to_i + 6*60*60
					Api::V1::TodaySerializer::BoxSerializer::OrderSerializer.new(order, scope: scope, root: false, box: object)
				end
			end
=end
			time = Time.now + 6*60*60
			object.orders.where("status = '1' and date(start_time) = ? and end_time > ?",Date.today,time).map do |order|
					Api::V1::TodaySerializer::BoxSerializer::OrderSerializer.new(order, scope: scope, root: false, box: object)
			end
		end

		class OrderSerializer < Api::V1::BaseSerializer
			attributes :id, :start_time, :end_time
		end

		def offorders
			time = Time.now + 6*60*60
			object.offorders.where("status = 't' and date(start_time) = ? and end_time > ?",Date.today,time).map do |offorder|
				Api::V1::TodaySerializer::BoxSerializer::OfforderSerializer.new(offorder, scope: scope, root: false, box: object)
			end
		end

		class OfforderSerializer < Api::V1::BaseSerializer
			attributes :id, :start_time, :end_time
		end

	end

end
