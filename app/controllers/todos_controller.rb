class TodosController < ApplicationController
  # This is the 'Todos Controller'. When a route gets routed to 'todos#{action}',
  # Rails will route it here. The action name is one of the below methods to be called upon.
  # As long as naming convention is followed, Rails knows what view to call upon based on what action
  # is called. Because this is the 'Todos Controller', Rails checks the views folder for
  # a 'todos' folder and selects the view with the same name as the action given.

  # Call set_todo method before the following array of actions
  before_action :set_todo, only: [:edit, :update, :show, :destroy]

  def new
    # This renders 'views/todos/new.html.erb
    # Instatiate a new Todo object to interact with in 'views/todos/new.html.erb'
    @todo = Todo.new
  end

  def create
    # This action is performed from a POST request and therefore needs to be redirected
    # Instantiate a new Todo object with parameters captured from the information entered
    # in the form from 'views/todos/new.html.erb'
    @todo = Todo.new(todo_params)
    # Save the Todo object
    if @todo.save
      flash[:notice] = "Todo was created success!"
      # If the todo is successfully saved, redirect to render '/todos/show.html.erb'
      # for that todo and 'flash' a notice letting the user know it was successful
      redirect_to todo_path(@todo)
    else
      # If not, render 'views/todos/new.html.erb'. Error messages will be displayed from the view
      render 'new'
    end
  end

  def show
    # This renders 'views/todos/show.html.erb
  end

  def edit
    # This renders 'views/todos/edit.html.erb
  end

  def update
    # This action is performed from a PUT/PATCH request and therefore needs to be redirected
    if @todo.update(todo_params)
      flash[:notice] = "Todo was successfully updated!"
      # If the todo is successfully updated, redirect to render '/todos/show.html.erb'
      # for that todo and 'flash' a notice letting the user know it was successful
      redirect_to todo_path(@todo)
    else
      # If not, render 'views/todos/new.html.erb'. Error messages will be displayed from the view
      render 'edit'
    end
  end

  def index
    # This renders 'views/todos/index.html.erb
    # All Todos currently in the database
    @todos = Todo.all
  end

  def destroy
    # This action is performed from a DELETE request and therefore needs to be redirected
    # Remove Todo from database
    @todo.destroy
    flash[:notice] = "Todo was deleted successfully"
    # If the todo is successfully deleted, redirect to render '/todos/index.html.erb'
    # for that todo and 'flash' a notice letting the user know it was successful
    redirect_to todos_path
  end

  private
  # Private method that will find Todo and set it to instance variable
    def set_todo
      @todo = Todo.find(params[:id])
    end

  # Private method to encapsulate the permissable parameters(Strong Parameter)
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
end
