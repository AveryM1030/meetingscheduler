class MeetingsController < ApplicationController

	def index
		@meetings = Meeting.all
	end

	def create
		# call constructor of Meeting model class giving it the 
		# first name, last name, and email paramters input in the hosts
		# new.html.erb
		# constructo create Meeting model object which is stored
		# in variable
		meetings = Meeting.new(meeting_params)
		# call save method on Meeting object
		# save method inserts the data in the Meeting model object
		# into the host table
		if meetings.save
			# if the save method succeeds, request the meetings URL
			# which will rendor the host index.html.erb in the browser
			redirect_to "/meetings"
		else
			# get full message associated with errors
			# store them in a Rails flash object names errors so that 
			# the full messages may be displayed in the meetings new.html.erb
			flash[:errors] = meetings.errors.full_messages
			# if the save method fails, request the meetings/new URL
			# which will rendor the meetings new.html.erb in the browser
			redirect_to "/meetings/new"
		end
	end

		# show method gets called when the meetings/:id URL is requested
		# show method is mapped to the meetings show.html.erb
	def show
		# call find method on Meeting model class giving it the id sent
		# in the request
		# find method selects all of the data in the movie table where
		# the id is equal to the id sent in the request
		# selected data will be returned in a array of actor object
		# store the array of actor objects in a instance variable
		# instance variable is available to meetings show.html.erb
		@participants = Meeting.find(params[:id]).participants
	end


	def update
		# call find method on Meeting model class giving it the id sent in the 
		# request
		# find method selects all of the data in the meeting table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stroed in a variable
		meetings = Meeting.find(params[:id])
		# call updated method on Meeting object giving it the name, location
		# and date paramerters imput in the meetings edit.html.erb
		# update method updates the data in the actor table use the parameters
		if meetings.update(meeting_params)
			# if the update method succeeds, request the meetings URL which
			# will render the meetings index.html.erb in the broswer
			redirect_to "/meetings"
		else
			# if the updated method fails, get the full messages associated
			# with the errors
			#store them in a Rails flash, object named errors so that 
			# the full messages may be displayed in the requested URl
			flash[:errors] = meetings.errors.full_messages
			redirect_to "/meetings/#{meetings.id}/edit"
			# edit.html.erb
		end
	end

	def edit
		# call find method on Meeting model class giving it the id sent
		# in the request
		# the find method selects all of the data in the meeting table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in an instance variable that will be
		# available to the edit.html.erb	
		@meetings = Meeting.find(params[:id])
	end

	def delete
		# call find method on Meeting model class giving it the id sent
		# in the request
		# the find method selects all of the data in the meeting table where
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
