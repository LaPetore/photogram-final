class UsersController < ApplicationController 
  def index 
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_template/index.html.erb" })
  end

  def show
    the_username = params.fetch("path_username")
    matching_users = User.where({ :username => the_username })
    @the_user = matching_users.at(0)

    render({ :template => "/user_template/show.html.erb" })
  end

end
