# each route consists of 3 parts: 1. HTTP method, 2. URL to web page
# view being requested, 3. name of Ruby class and method envoked when
# URL to web page view is requested.
Rails.application.routes.draw do
  # When a get requested is made for the hosts URL,
# Rails envokes the index method in the hosts Ruby controller class.
# Rails automatically maps the index method to a web page view named
# index.html.erb and serves the web page to the browser where its
# rendered.
get "host" => "host#index"
get "host/new" => "host#new"
# When a post request is made for the hosts URL,
# Rails envokes the create method in the hosts Ruby controller class
post "host" => "host#create"
get "host/:id/edit" => "host#edit"
post "hosts/:id" => "hosts#update"
get "hosts/:id/delete" => "host#delete"
delete "host/:id" => "host#destroy"
 get "meettings" => "meetings#index"
 get "meetings/new" => "meetings#new"
 post "meetings" => "meetings#create"
end
