class Api::V1::CarwashesController < Api::V1::BaseController
	respond_to :json
	before_filter :authenticate_user!, only: [:show, :index]

	def show
		
		@carwash = Carwash.find(params[:id])
		#authorize @user

		#@current_user = user
		render :json => {
			:carwash => @carwash.as_json(only: [:id, :name, :phone_number, :created_at], include: { city: { only: [:id, :name]}}, include: { prices: { only: [:id, :price], include: { car_type: { only: [:id, :name]}, service: {only: [:id, :name]}}}})#, car_type: { only: [:id, :name]}})
		}
		#render(json: Api::V1::UserSerializer.new(user).to_json)
	end

	def index

	end
end