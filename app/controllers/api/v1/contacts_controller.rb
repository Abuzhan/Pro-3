class Api::V1::ContactsController < Api::V1::BaseController

	def index

		text = "+77075441777 (Abuzhan)
		+77474873388 (Marat)"

		render :json => {
			:contacts => text.as_json
		}
	end

end