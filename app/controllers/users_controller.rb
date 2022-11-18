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
     ## @current_user = User.where({ :id => session.fetch(:user_id) })
      @the_user = matching_users.at(0)

      if FollowRequest.where({ :recipient_id => @the_user.id, :status => "accepted", :sender_id => session.fetch(:user_id) }).size > 0
        p ".........................."
        p FollowRequest.where({ :recipient_id => @the_user.id, :status => "accepted", :sender_id => session.fetch(:user_id) }).size
        render({ :template => "/user_template/show.html.erb" })
      elsif !@the_user.private  
        render({ :template => "/user_template/show.html.erb" })
        
        
      else
        redirect_to("/users", { alert: "You are not authorized for that." })
      end
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

  def show_feed
    the_username = params.fetch("path_username")
    matching_users = User.where({ :username => the_username })
    @the_user = matching_users.at(0)

    e = FollowRequest.where({ :status => "accepted", :sender_id => @the_user.id })
    @photos = [];
    e.each do |a_request|
      g = Photo.where({ :owner_id => a_request.recipient_id })
      g.each do |a_photo|
        @photos.push(a_photo)
      end

    end

    render({ :template => "/user_template/show_feed.html.erb" })
  end

  def show_discover
    the_username = params.fetch("path_username")
    matching_users = User.where({ :username => the_username })
    @the_user = matching_users.at(0)

    e = FollowRequest.where({ :status => "accepted", :sender_id => @the_user.id })
    @photos = [];
    e.each do |a_request|
      g = Like.where({ :fan_id => :recipient_id }) 
      h = Photo.where({ :owner_id => a_request.recipient_id })
      h.each do |a_photo|
        @photos.push(a_photo) 
      end
    end


    render({ :template => "/user_template/show_discover.html.erb" })
  end

  
  def update 
    the_username = params.fetch("path_username")
    the_user = User.where({ :username => the_username }).at(0)

    the_user.username = params.fetch("query_username")
    the_user.private = params.fetch("query_private", false)

    if the_user.valid?
      the_user.save 

      redirect_to("/users/#{the_user.username}", { :notice => "User successfully updated." })
    else
      redirect_to("/users/#{the_user.username}", { :alert => "User failed to update." })
    end
  end

end
