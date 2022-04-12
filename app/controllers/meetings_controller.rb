class MeetingsController < ApplicationController

	def index
		@meetings = Meeting.all
	end

	def create
		# call constructor of Host model class giving it the 
		# first name, last name, and email paramters input in the hosts
		# new.html.erb
		# constructo create Host model object which is stored
		# in variable
		meetings = Meeting.new(meeting_params)
		# call save method on Host object
		# save method inserts the data in the Host model object
		# into the host table
		if meetings.save
			# if the save method succeeds, request the hosts URL
			# which will rendor the host index.html.erb in the browser
			redirect_to "/meetings"
		else
			# get full message associated with errors
			# store them in a Rails flash object names errirs so that 
			# the full messages may be displayed in the hosts new.html.erb
			flash[:errors] = meetings.errors.full_messages
			# if the save method fails, request the hosts/new URL
			# which will rendor the hosts new.html.erb in the browser
			redirect_to "/meetings/new"
		end
	end

	def update
		# call find method on Actor model class giving it the id sent in the 
		# request
		# find method selects all of the data in the actor table where
		# the id is qual to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stroed in a variable
		meetings = Meeting.find(params[:id])
		# call updated method on Actor object giving it the first name and
		# last name paramerters imput in the actors edit.html.erb
		# update method updates the data in the actor table use the parameters
		if meetings.update(meeting_params)
			# if the update method succeeds, request the actors URL which
			# will render the actors index.html.erb in the broswer
			redirect_to "/meetings"
		else
			# if the updated method fails, get the full messages associated
			# with the errors
			#store them in a Rails flash, object named errors so that 
			# the full messages may be displayed in the requested URl
			flash[:errors] = meetings.errors.full_messages
			redirect_to "/meetings/#{meeting.id}/edit"
			# request the actors/:id/edit URl which will render the actors
			# edit.html.erb
		end
	end

	def edit
		# call find method on Actor model class giving it the id sent
		# in the request
		# the find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in an instance variable that will be
		# available to the edit.html.erb	
		@meetings = Meeting.find(params[:id])
	end

	def delete
		# call find method on Actor model class giving it the id sent
		# in the request
		# the find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in an instance variable that will be
		# available to the delete.html.erb	
		@meetings = Meeting.find(params[:id])
	end

	def destroy
		meetings = Meeting.find(params[:id])
		meetings.destroy
		redirect_to "/meetings"
	end

	private 
	def meeting_params
		# params is a Rails object that gets the specified request
		# paramters
		params.require(:meetings).permit(:name, :location, :date)
	end
end
