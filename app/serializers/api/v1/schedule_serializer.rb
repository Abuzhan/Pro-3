class Api::V1::ScheduleSerializer < Api::V1::BaseSerializer
	attributes :schedules

	def schedules
		object.schedules.where("status = 't'").map do |schedule|
			Api::V1::ScheduleSerializer::EachSerializer.new(schedule, root: false, scope: scope, carwash: object)
		end
	end

	class EachSerializer < Api::V1::BaseSerializer
		attributes :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
	end
end