class AssoicateController < ApplicationController# index method gets called when the assoicates URL is requested
	# index method is mapped to the assoicate index.html.erb
	def index
		# call all method on Meeting model class.
		# all method selects all of the data in the meeting table
		# and returns the data as an array of objects.
		# store the array of objects in an instance variable.
		# instance varialbe is avaliable to assoicates index.html.erb.
		@meetings = Meeting.all
		# call all method on Participant model class.
		# all method selects all of the data in the participant table
		# and returns the data as an array of objects.
		# store the array of objects in an instance variable.
		# instance varialbe is avaliable to assoicates index.html.erb.
		@participants = Participant.all
		return @meetings, @participants
	end

	# create method gets called when the Create button is pushed on the
	# assoicates index.html.erb
	def create
		# call constructor of Assoicates model class giving it the 
		# meeting id and participant id paramters input in the assoicates
		# new.html.erb
		# constructor create Assoicates model object which is stored
		# in variable
		assoicate = Associate.new(Associate_params)
		# call save method on Associate object
		# save method inserts the data in the Associate model object
		# into the Associate table
		if associate.save
			# if the save method succeeds, request the Associate URL
			# which will rendor the meetings index.html.erb in the browser
			redirect_to "/meetings"
		else
			# get full message associated with errors
			# store them in a Rails flash object names errirs so that 
			# the full messages may be displayed in the Associate index.html.erb
			flash[:errors] = Associate.errors.full_messages
			# if the save method fails, request the Associate/new URL
			# which will rendor the Associate index.html.erb in the browser
			redirect_to "/associate/index"
		end
	end

	private
	def associate_params
		# params is a Rails onject that gets the specified request
		# paramters
		params.require(:assoicate).permit(:meeting_id, :participant_id)
	end
end

end
