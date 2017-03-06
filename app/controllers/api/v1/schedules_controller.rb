class Api::V1::SchedulesController < Api::V1::BaseController

	respond_to :json
	before_filter :authenticate_user!, only: [:show, :index]

	def show
		t = Time.now
		@schdule
		render :json => { :time_now => t.as_json }
	end

end