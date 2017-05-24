class Api::V1::OfflinesController < Api::V1::BaseController

	def show
		@carwash = Carwash.find(params[:id])

		@offprices = @carwash.offprices
		@offprices = @offprices.sort { |x,y| x.car_type.priority <=> y.car_type.priority }

		@combos = @carwash.combos
		@combos = @combos.sort { |x,y| x.car_type.priority <=> y.car_type.priority }

		render :json => {
			:offprices => @offprices.as_json(
				only: [:id, :price, :description], 
						include: { 
							car_type: { only: [:id, :name, :priority]}, 
							offservice: {only: [:id, :name]}
						}
			),
			:combos => @combos.as_json(
				only: [:id, :name, :price, :description],
						include: { 
							car_type: { only: [:id, :name]}
						}
			)
		}
	end
end
