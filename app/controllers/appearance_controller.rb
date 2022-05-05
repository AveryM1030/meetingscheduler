class AppearanceController < ApplicationController
	def index
		@meetings = Meeting.all
		@hosts = Host.all
		return @meetings, @hosts
	end

	def create
		# call constructor of Appearance model class giving it the 
		# acor id and movie id paramters input in the appearances
		# index.html.erb
		# constrctor creates Appearances model object which is stroed
		# in variable
		appearance = Appearance.new(appearance_params)
		# call save method on Appearance object
		# save method inserts the data in the Appearance model object
		# into the actor table
		if appearance.save
			# if the save method succeeds, request the appearances URL
			# which will rendor the actors index.html.erb in the browser
			redirect_to "/meetings"
		else 
			# get full messages associated with errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the appearances index.html.erb
			flash[:errors] = appearance.errors.full_messages
			# if the save method fails, request the appearances/new URL
			# which will rendor the apearances new.html.erb in the browser
			redirect_to "/appearance/index"
		end
	end

	def show
		# call find method on Participant model class giving it the id sent
		# in the request
		# find method selects all of the data in the participant table where
		# the id is equal to the id sent in the request
		# selected data will be returned in a array of meeting object
		# store the array of meeting objects in a instance variable
		# instance variable is available to participant show.html.erb
		@hosts = Meeting.find(params[:id]).hosts
	end

	private 
	def appearance_params
		# params is a Rails object that gets the specified request
		# paramters
		params.require(:appearance).permit(:meeting_id, :host_id)
	end
end
