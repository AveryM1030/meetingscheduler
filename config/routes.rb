# each route consists of 3 parts: 1. HTTP method, 2. URL to web page
# view being requested, 3. name of Ruby class and method envoked when
# URL to web page view is requested.
Rails.application.routes.draw do
  # When a get requested is made for the hosts URL,
# Rails envokes the index method in the hosts Ruby controller class.
# Rails automatically maps the index method to a web page view named
# index.html.erb and serves the web page to the browser where its
# rendered.
get "hosts" => "hosts#index"
get "hosts/new" => "hosts#new"
# When a post request is made for the hosts URL,
# Rails envokes the create method in the hosts Ruby controller class
post "hosts" => "hosts#create"
get "hosts/:id/edit" => "hosts#edit"
post "hosts/:id" => "hosts#update"
get "hosts/:id/delete" => "hosts#delete"
delete "hosts/:id" => "hosts#destroy"
get "hosts/:id/meetings" => "hosts#show"
get "meetings" => "meetings#index"
get "meetings/new" => "meetings#new"
post "meetings" => "meetings#create"
get "meetings/:id/edit" => "meetings#edit"
post "meetings/:id" => "meetings#update"
get "meetings/:id/delete" => "meetings#delete"
delete "meetings/:id" => "meetings#destroy"
get "participants" => "participants#index"
get "participants/new" => "participants#new"
post "participants" => "participants#create"
get "participants/:id/edit" => "participants#edit"
post "participants/:id" => "participants#update"
get "participants/:id/delete" => "participants#delete"
delete "participants/:id" => "participants#destroy"
get "appearance" => "appearance#index"
post "appearance" => "appearance#index"
get "associate" => "associate#index"
post "associate" => "associate#create"
get "meetings/:id" => "meetings#show"
post "meetings/:id" => "meetings#show"

get "associate/:id" => "associate#index"
post "associate/:id" => "associate#index"

get "meetings/:id" => "meetings#showOne"
post "meetings/:id" => "meetings#showOne"


get "participants/id:" => "participants#show"
end