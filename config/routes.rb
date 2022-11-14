Rails.application.routes.draw do
  # Routes fo the Likes account:

  # CREATE

  post("/create_like", { :controller => "likes", :action => "create" })

  # DELETE

  get("/delete_like/:path_id", { :controller => "likes", :action => "delete" })





  # Routes for the FollowRequests account:

  # CREATE 

  post("/insert_follow_request", { :controller => "follow_requests", :action => "create" })

  # DELETE 

  get("/delete_follow_request/:path_id", { :controller => "follow_requests", :action => "delete" })







  # Routes for the USER account:

  # READ 

  get("/", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "show" })

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  

  # Routes for the PHOTO account:

  # READ 

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  # CREATE

  post("/create_photo", { :controller => "photos", :action => "create" })

  # UPDATE

  post("/update_photo/:path_id", { :controller => "photos", :action => "update" })

  # DELETE 

  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete" })




  # Routes for the Comment account:

  # CREATE 

  post("/create_comment", { :controller => "comments", :action => "create" })

  

  



end
