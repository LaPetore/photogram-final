class PhotosController < ApplicationController 
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "/photo_template/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => the_id })

    render({ :template => "/photo_template/show.html.erb" })
  end

end 
