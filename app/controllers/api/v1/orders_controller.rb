class Api::V1::OrdersController < Api::V1::BaseController

	respond_to :json
	before_filter :authenticate_user!

	def index
		@user = @current_user

		#render :json => {
		#	:orders => @user.orders.as_json(
		#		only: [:id, :carwash_name, :carwash_address, :service_name :start_time, :end_time, :status],
		#		include: {
		#			box: { only: [:id], include: { carwash: {only: [:id, :name, :address]}}},
		#			price: { only: [:id, :price]}
		#		}
		#	)
		#}

		render json: @user.orders, each_serializer: Api::V1::AllorderSerializer

	end

	def show
		@order = Order.find(params[:id])
		@user = @current_user
		if @order.user == @user
			render json: @order, serializer: Api::V1::AllorderSerializer
		else
			return api_error(status: 401, errors: "Unauthorized")
		end
	end

	def create
		user = @current_user
		order = user.orders.build(create_params)
		return api_error(status: 422, errors: order.errors) unless order.valid?

		user_orders = user.orders.where("status = '1' and date(start_time) >= ?",Date.today)
		
		if user_orders.length >= 50
			return api_error(status: 429, errors: "User reached the maximum level of orders")
		else
			order.save!

			render(
				json: Api::V1::OrderSerializer.new(order).to_json,
				status: 201,
				serizalizer: Api::V1::OrderSerializer
			)
		end
	end

	def destroy
		@order = Order.find(params[:id])
		if @order.user == @current_user
			@order.status = "2"
			@order.save!
			msg = "Cancelled"
			render :json => msg, status: 200
		else
			return api_error(status: 401, errors: "Unauthorized")
		end
	end



	private

	def create_params
		params.require(:order).permit(
			:box_id, :start_time, :end_time, :price_id, :status
			).delete_if{ |k,v| v.nil?}
	end

end

