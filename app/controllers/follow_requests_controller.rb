class FollowRequestsController < ApplicationController 
  def create 
    the_follow_request = FollowRequest.new
    the_follow_request.recipient_id = params.fetch("query_recipient_id")
    the_follow_request.sender_id = params.fetch("query_sender_id")
    the_follow_request.status = params.fetch("query_status")

    if the_follow_request.valid? 
      the_follow_request.save
      
      redirect_to("/", { :notice => "Request successful." })
    else 
      redirect_to("/", { :alert => "Request failed." })
    end
  end

  def update 
    the_id = params.fetch("path_id")
    the_request = FollowRequest.where({ :id => the_id }).at(0)
    the_request.status = params.fetch("query_status")

    if the_request.valid?
      the_request.save 

      redirect_to("/")
    end 
  end

  def delete 
    the_id = params.fetch("path_id")
    the_request = FollowRequest.where({ :id => the_id })

    the_request.destroy 

    redirect_to("/", { :notice => "Follow request cancelled." })
  end

end
