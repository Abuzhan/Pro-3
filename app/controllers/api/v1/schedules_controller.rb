class Api::V1::SchedulesController < Api::V1::BaseController

	respond_to :json
	before_filter :authenticate_user!, only: [:show, :index]

	def show
		@carwash = Carwash.find(params[:id])
		id = @carwash.id
		@boxes = @carwash.boxes#.where("carwash_id = id")
		@orders = @boxes.orders.each
		#t = Time.now
		render :json => {
			#:carwash => @carwash.as_json(
			#	include: {
			#		schedules: { only: [
			#			:id, 
			#			:monday, 
			#			:tuesday, 
			#			:wednesday, 
			#			:thursday, 
			#			:friday, 
			#			:saturday, 
			#			:sunday
			#		]}
			#	}
			#),
			:week => Api::V1::ScheduleSerializer.new(@carwash, root: false).as_json,
			#:today => Api::V1::TodaySerializer.new(@carwash, root: false).as_json,
			:tomorrow => Api::V1::TomorrowSerializer.new(@carwash, root: false).as_json,
			#:orders => @orders.as_json
		}
	
	end

end