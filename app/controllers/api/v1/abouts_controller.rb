class Api::V1::AboutsController < Api::V1::BaseController

	def index
		text = "We are very clever and beautiful people"

		render :json => {
			:about_us => text.as_json
		}

	end
end