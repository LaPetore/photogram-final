class UsersController < ApplicationController 
  def index 
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "/user_template/index.html.erb" })
  end

  def show
    if session.fetch(:user_id) != nil
      the_username = params.fetch("path_username")
      matching_users = User.where({ :username => the_username })
      @the_user = matching_users.at(0)

      render({ :template => "/user_template/show.html.erb" })
    else 
      redirect_to("/user_sign_in", { alert: "You have to sign in first."})
    end
  end

  def show_liked_photos
    the_username = params.fetch("path_username")
    matching_users = User.where({ :username => the_username })
    @the_user = matching_users.at(0)

    render({ :template => "/user_template/show_liked_photos.html.erb" })
  end

  

  def update 
    the_id = params.fetch("path_username")
    the_user = User.where({ :id => the_id })

    the_user.username = params.fetch("query_username")
    the_user.private = params.fetch("query_private")

    if the_user.valid?
      the_user.save 

      redirect_to("/users/:path_username", { :notice => "User successfully updated." })
    else
      redirect_to("/users/:path_username", { :alert => "User failed to update." })
    end
  end

end
