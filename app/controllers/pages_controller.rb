class PagesController < ApplicationController
  # This is the 'Pages Controller'. When a route gets routed to 'pages#{action}',
  # Rails will route it here. The action name is one of the below methods to be called upon.
  # As long as naming convention is followed, Rails knows what view to call upon based on what action
  # is called. Because this is the 'Pages Controller', Rails checks the views folder for
  # a 'pages' folder and selects the view with the same name as the action given.
  def home
    # This renders 'views/pages/home.html.erb'
  end

  def about
    # This renders 'views/pages/about.html.erb'
  end

  def help
    # This renders 'views/pages/help.html.erb'
  end
end
