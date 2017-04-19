class Api::V1::SchedulesController < Api::V1::BaseController

	respond_to :json
	before_filter :authenticate_user!, only: [:show, :create]

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
			:today => Api::V1::TodaySerializer.new(@carwash, root: false).as_json,
			:tomorrow => Api::V1::TomorrowSerializer.new(@carwash, root: false).as_json,
			#:orders => @orders.as_json
		}
	
	end

	def create
		user = @current_user
		order = user.orders.build(create_params)
		return api_error(status: 422, errors: order.errors) unless order.valid?
		order.save!

		render(
			json: Api::V1::OrderSerializer.new(order).to_json,
			status: 200,
			serizalizer: Api::V1::OrderSerializer
		)
	end

	private

	def create_params
		params.require(:order).permit(
			:user_id, :box_id, :start_time, :end_time, :price_id, :status
			).delete_if{ |k,v| v.nil?}
	end



end