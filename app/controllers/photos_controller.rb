class PhotosController < ApplicationController 
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "/photo_template/index.html.erb" })
  end

  def show
    if session.fetch(:user_id) != nil 
      the_id = params.fetch("path_id")
      matching_photos = Photo.where({ :id => the_id })
      @the_photo = matching_photos.at(0)

      render({ :template => "/photo_template/show.html.erb" })
    else 
      redirect_to("/user_sign_in", { :alert => "You have to sign in first." })
    end
  end

  def create 
    the_photo = Photo.new
    the_photo.image = params.fetch("query_image")
    the_photo.caption = params.fetch("query_caption")
    the_photo.owner_id = params.fetch("query_owner_id")

    if the_photo.valid? 
      the_photo.save 

      redirect_to("/photos", { :notice => "Photo created successfully." })
    else 
      redirect_to("/photos", { :alert => "Photo did not create successfully." })
    end
  end

  def update 
    the_id = params.fetch("path_id")
    the_photo = Photo.where({ :id => the_id }).at(0)

    the_photo.caption = params.fetch("query_caption")
    the_photo.image = params.fetch("query_image")

    if the_photo.valid? 
      the_photo.save 

      redirect_to("/photos", { :notice => "Photo successfully updated." })
    else 
      redirect_to("/photos", { :alert => "Photo failed to update." })
    end
  end

  def delete 
    the_id = params.fetch("path_id")
    the_photo = Photo.where({ :id => the_id }).at(0)

    the_photo.destroy 

    redirect_to("/photos", { :notice => "Photo successfully deleted." })
  end
end 
