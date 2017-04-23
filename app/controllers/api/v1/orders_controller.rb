class Api::V1::OrdersController < Api::V1::BaseController

	respond_to :json
	before_filter :authenticate_user!

	def index
		@user = @current_user

		#render :json => {
		#	:myorders => @user.orders.as_json(
		#		only: [:id, :box_id, :start_time, :end_time, :status],
		#		include: {
		#			box: { only: [:id], include: { carwash: {only: [:id, :name, :address]}}},
		#			price: { only: [:id, :price]}
		#		}
		#	)
		#}

		render json: @user.orders, each_serializer: Api::V1::OrderSerializer

	end

	def show
		@order = Order.find(params[:id])
		@user = @current_user
		if @order.user == @user
			render json: @order, serializer: Api::V1::OrderSerializer
		else
			return api_error(status: 401, errors: "Unauthorized")
		end
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

	def destroy
		@order = Order.find(params[:id])
		if @order.user == @current_user
			@order.status = "2"
			@order.save!
			msg = "Dancelled"
			render :json => msg, status: 200
		else
			return api_error(status: 401, errors: "Unauthorized")
		end
	end



	private

	def create_params
		params.require(:order).permit(
			:user_id, :box_id, :start_time, :end_time, :price_id, :status
			).delete_if{ |k,v| v.nil?}
	end

end
