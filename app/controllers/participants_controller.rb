class ParticipantsController < ApplicationController
	def index
		@participants = Participant.all
	end

	def create
		# call constructor of Participant model class giving it the 
		# fullname and email paramters input in the hosts
		# new.html.erb
		# constructo create Participant model object which is stored
		# in variable
		participants = Participant.new(participant_params)
		# call save method on Participant object
		# save method inserts the data in the Participant model object
		# into the host table
		if participants.save
			# if the save method succeeds, request the participant URL
			# which will rendor the participant index.html.erb in the browser
			redirect_to "/participants"
		else
			# get full message associated with errors
			# store them in a Rails flash object names errirs so that 
			# the full messages may be displayed in the participants new.html.erb
			flash[:errors] = participants.errors.full_messages
			# if the save method fails, request the participants/new URL
			# which will rendor the participants new.html.erb in the browser
			redirect_to "/participants/new"
		end
	end

	def edit
		# call find method on Participant model class giving it the id sent
		# in the request
		# the find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in an instance variable that will be
		# available to the edit.html.erb	
		@participants = Participant.find(params[:id])
	end

		# show method gets called when the participant/:id URL is requested
		# show method is mapped to the participant show.html.erb
	def show
		# call find method on Participant model class giving it the id sent
		# in the request
		# find method selects all of the data in the participant table where
		# the id is equal to the id sent in the request
		# selected data will be returned in a array of meeting object
		# store the array of meeting objects in a instance variable
		# instance variable is available to participant show.html.erb
		@meetings = Participant.find(params[:id]).meetings
	end

	def update
		# call find method on Participant model class giving it the id sent in the 
		# request
		# find method selects all of the data in the actor table where
		# the id is qual to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stroed in a variable
		participants = Participant.find(params[:id])
		# call updated method on Participant object giving it the first name and
		# last name paramerters imput in the actors edit.html.erb
		# update method updates the data in the actor table use the parameters
		if participants.update(participant_params)
			# if the update method succeeds, request the actors URL which
			# will render the actors index.html.erb in the broswer
			redirect_to "/participants"
		else
			# if the updated method fails, get the full messages associated
			# with the errors
			#store them in a Rails flash, object named errors so that 
			# the full messages may be displayed in the requested URl
			flash[:errors] = participants.errors.full_messages
			redirect_to "/participants/#{participants.id}/edit"
			# request the actors/:id/edit URl which will render the actors
			# edit.html.erb
		end
	end

	def delete
		# call find method on Actor model class giving it the id sent
		# in the request
		# the find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in an instance variable that will be
		# available to the delete.html.erb	
		@participants = Participant.find(params[:id])
	end

	def destroy
		participants = Participant.find(params[:id])
		participants.destroy
		redirect_to "/participants"
	end

	private 
	def participant_params
		# params is a Rails object that gets the specified request
		# paramters
		params.require(:participants).permit(:fullname, :email)
	end
end
