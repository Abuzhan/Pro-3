class Api::V1::CarwashesController < Api::V1::BaseController

	respond_to :json
	before_filter :authenticate_user!, only: [:show, :index]

	def show
		@carwash = Carwash.find(params[:id])
		@user = @current_user
		@services = Service.all
		@services = @services.sort { |x,y| x.name.length <=> y.name.length }

		if @user.favorite?(@carwash)
			favorite = "Yes"
		else
			favorite = "No"
		end

		@prices = @carwash.prices
		@prices = @prices.sort { |x,y| x.car_type.priority <=> y.car_type.priority }

		
		

		render :json => {
			:services => @services.as_json(
				only: [:id, :name]),
			:carwash => @carwash.as_json(
				only: [:id, :name, :phone_number, :address, :contacts], 
				include: { 
					city: { only: [:id, :name]},
=begin					prices: { only: [:id, :price, :description], 
						include: { 
							car_type: { only: [:id, :name]}, 
							service: {only: [:id, :name]}
						}
					},
					offprices: { only: [:id, :price, :description], 
						include: { 
							car_type: { only: [:id, :name]}, 
							offservice: {only: [:id, :name]}
						}
					},
					combos: { only: [:id, :name, :price, :description],
						include: { 
							car_type: { only: [:id, :name]}
						}
					}
=end
				}
			),
			:prices => @prices.as_json(
				only: [:id, :price, :description], 
						include: { 
							car_type: { only: [:id, :name, :priority]}, 
							service: {only: [:id, :name]}
						}
			),
			:favorite? => favorite.as_json
		}

		#render :json => {
		#	:carwash => Api::V1::CarinfoSerializer.new()
		#}
	end

	def index

		request_city_id = request.headers['City']
		@city = City.find(request_city_id)

		render(
			json:Api::V1::CitySerializer.new(@city, root: false).as_json,
		)
		
	end

end