class AssociateController < ApplicationController
	# index method gets called when the associate URL is requested
	# index method is mapped to the appearance index.html.erb
	def index
		# call all method on Meeting model class.
		# all method selects all of the data in the actor table
		# and returns the data as an array of objects.
		# store the array of objects in an instance variable.
		# instance varialbe is avaliable to associates index.html.erb.
		@meetings = Meeting.all
		# call all method on Participant model class.
		# all method selects all of the data in the movie table
		# and returns the data as an array of objects.
		# store the array of objects in an instance variable.
		# instance varialbe is avaliable to associates index.html.erb.
		@participants = Participant.all
		return @meetings, @participants
	end

	# create method gets called when the Create button is pushed on the
	# appearances index.html.erb
	def create
		# call constructor of Associates model class giving it the 
		# actor id and movie id paramters input in the appearances
		# new.html.erb
		# constructor create Associates model object which is stored
		# in variable
		associate = Associate.new(associate_params)
		# call save method on Associate object
		# save method inserts the data in the Associate model object
		# into the associate table
		if associate.save
			# if the save method succeeds, request the associate URL
			# which will rendor the meetings index.html.erb in the browser
			redirect_to "/meetings"
		else
			# get full message associated with errors
			# store them in a Rails flash object names errirs so that 
			# the full messages may be displayed in the associate index.html.erb
			flash[:errors] = associate.errors.full_messages
			# if the save method fails, request the associate/new URL
			# which will rendor the associate index.html.erb in the browser
			redirect_to "/associates/index"
		end
	end

	private
	def associate_params
		# params is a Rails onject that gets the specified request
		# paramters
		params.require(:associate).permit(:meeting_id, :participant_id)
	end
end
