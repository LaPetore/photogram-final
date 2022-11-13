class LikesController < ApplicationController 
  def create
    the_like = Like.new
    the_like.fan_id = params.fetch("query_fan_id")
    the_like.photo_id = params.fetch("query_photo_id")

    if the_like.valid?
      the_like.save 

      redirect_to("/photos", { :notice => "Like successfully created." })
    else 
      redirect_to("/photos", { :alert => "Failed to successfully like." })
    end
  end


end 
