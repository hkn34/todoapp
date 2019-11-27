Rails.application.routes.draw do

  # When a url is entered into the browser, a request gets sent to the router(this file).
  # The router then routes the request to the appropriate controller.

  # Homepage route
  # root sets '/' as route and what follows is the controller and action that will be set
  # for the '/' route
  root 'pages#home'
  # About Page route
  # In this instance, 'get' is the request type, '/about' is the route entered into the browser,
  # 'pages'(before the #), is the controller used, and 'about'(after the #), is the
  # action that the controller needs to perform
  get '/about', to: 'pages#about'
  # About Page route
  get '/help', to: 'pages#help'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 'rescources :todo' generates all common routes for the todos_controller
  # (i.e. index, show, new, edit, create, update, and destroy)
  ##Routes guide:

  ##GET	      /todos	        todos#index	  display a list of todos
  ##GET	      /todos/new    	todos#new	    return an HTML form for creating a new todo
  ##POST	    /todos        	todos#create	create a new todo
  ##GET	      /todos/:id     	todos#show   	display a specific todo
  ##GET	      /todos/:id/edit	todos#edit   	return an HTML form for editing a todo
  ##PATCH/PUT	/todos/:id    	todos#update	update a specific todo
  ##DELETE  	/todos/:id    	todos#delete	delete a specific todo
  resources :todos
end
