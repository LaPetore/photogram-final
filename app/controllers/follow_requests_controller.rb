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

end
