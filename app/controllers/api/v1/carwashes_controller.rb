class Api::V1::CarwashesController < Api::V1::BaseController

	respond_to :json
	before_filter :authenticate_user!, only: [:show, :index]

	def show
		@carwash = Carwash.find(params[:id])

		render :json => {
			:carwash => @carwash.as_json(
				only: [:id, :name, :phone_number, :address, :contacts], 
				include: { 
					city: { only: [:id, :name]}
					}, 
				include: { 
					prices: { only: [:id, :price], 
						include: { 
							car_type: { only: [:id, :name]}, 
							service: {only: [:id, :name]}
						}
					}
				}
			)
		}
	end

	def index
		@user = User.find_by(params[:id])
		request_city_id = request.headers['City']
		@city = City.find(request_city_id)
		#@carwashes = Carwash.all
		render(
			json:Api::V1::CitySerializer.new(@city, root: false).as_json,
		)
	end
end