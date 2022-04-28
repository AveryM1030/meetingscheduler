class HostsController < ApplicationController
	# index method gets called when the hosts URL is requested.
	# index method gets mapped to the hosts index.html.erb.
	def index
		# call all method on Host model class.
		# all method selects all of the data in the host table
		# and returns the data as an array of objects.
		# store the array of objects in an instance variable.
		# instance varialbe is avaliable to hosts index.html.erb.
		@hosts = Host.all
	end


	# create method gets called when the Create button is pushed on
	# the actors new.hthml.erb.
	def create
		# call constructor of Host model class giving it the 
		# fullname, and email paramters input in the hosts
		# new.html.erb
		# constructo create Host model object which is stored
		# in variable
		hosts = Host.new(host_params)
		# call save method on Host object
		# save method inserts the data in the Host model object
		# into the host table
		if hosts.save
			# if the save method succeeds, request the hosts URL
			# which will rendor the host index.html.erb in the browser
			redirect_to "/hosts"
		else
			# get full message associated with errors
			# store them in a Rails flash object names errirs so that 
			# the full messages may be displayed in the hosts new.html.erb
			flash[:errors] = hosts.errors.full_messages
			# if the save method fails, request the hosts/new URL
			# which will rendor the hosts new.html.erb in the browser
			redirect_to "/hosts/new"
	end
end

	# edit method gets called when the hosts/:id/edit URL is requested
	# edit method is mapped to the host edit.html.erb
	def edit
		# call find method on Host model class giving it the id sent
		# in the request
		# the find method selects all of the data in the host table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in a instance variable that will be
		# available to the edit.html.erb
		@hosts = Host.find(params[:id])
	end

	# update method gets called when the Update button is pushed on the 
	# hosts edit.html.erb
	def update
		# call find method on Host model class giving it the id sent in the 
		# request
		# find method selects all of the data in the host table where
		# the id is equal to the id sent in the request
		# the seleted data will be returned as an object
		# the object will be stored in a variable
		host = Host.find(params[:id])
		# call update methon on Host object giving it the first name, last name
		# email parameters input in the hosts edit.html.erb
		# update method updates that data in the host table use the parameter
		if host.update(host_params)
			# if the update method succeeds, request the host URL which
			# will render the hosts index.html.erb in the broswer
			redirect_to "/hosts"
		else
			# if the update method fails, get the full messages associated
			# with the errors
			# store them in a Rails flash object named errors so that 
			# the full messages may be displayed in the requested URL
			flash[:errors] = host.errors.full_messages
			# request the hosts/:id/edit URl which will render the hosts
			# edit.html.erb
			redirect_to "/hosts/#{host.id}/edit"
		end
	end
	# show method gets called when the movies/:id URL is requested 
	# show method is mappled to the movies show.html.erb
	def show
		# call find method on Movies model class giving it the id sent
		# in the request
		# find method selects all of the data in the movie table where
		# the id is equal to the id sent in the request 
		# selected data will be reutrned in an array of movie objects 
		# store the array of movie objects in an instance variable 
		# instance variable is available to movies show.html.erb
		@meetings = Host.find(params[:id]).meetings
	end 

	def edit
		@hosts = Host.find(params[:id])
	end

	# delete method gets called when the hosts/:id/delete URL is requested
	# delete method is mapped to the hosts delete.html.erb
	def delete
		# call find method on Host model class giving it the id sent
		# in the request
		# the find method selects all of the data in the host table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in a instance variable that will be
		# available to the delete.html.erb
		@hosts = Host.find(params[:id])
	end

	# destroy method gets called when the Delete button is pushed on the 
	# Host delete.html.erb
	def destroy
		host = Host.find(params[:id])
		host.destroy
		redirect_to "/hosts"
	end

	def show
		# call find method on Actor model class giving it the id sent
		# in the request
		# find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request 
		# selected data will be reutrned in an array of movie objects 
		# store the array of movie objects in an instance variable 
		# instance variable is available to actors show.html.erb
		@meetings = Host.find(params[:id]).meetings
	end 

	private
	def host_params
		# params is a Rails onject that gets the specified request
		# paramters
		params.require(:host).permit(:fullname, :email)
	end
end

