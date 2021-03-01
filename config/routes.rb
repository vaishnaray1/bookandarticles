Rails.application.routes.draw do



  # Routes for the Book articles tag resource:

  get("/",{:controller => "reviews", :action => "index"})

  # CREATE
  post("/insert_book_articles_tag", { :controller => "book_articles_tags", :action => "create" })
          
  # READ
  get("/book_articles_tags", { :controller => "book_articles_tags", :action => "index" })
  
  get("/book_articles_tags/:path_id", { :controller => "book_articles_tags", :action => "show" })
  
  # UPDATE
  
  post("/modify_book_articles_tag/:path_id", { :controller => "book_articles_tags", :action => "update" })
  
  # DELETE
  get("/delete_book_articles_tag/:path_id", { :controller => "book_articles_tags", :action => "destroy" })

  #------------------------------

  # Routes for the Review tag resource:

  # CREATE
  post("/insert_review_tag", { :controller => "review_tags", :action => "create" })
          
  # READ
  get("/review_tags", { :controller => "review_tags", :action => "index" })
  
  get("/review_tags/:path_id", { :controller => "review_tags", :action => "show" })
  
  # UPDATE
  
  post("/modify_review_tag/:path_id", { :controller => "review_tags", :action => "update" })
  
  # DELETE
  get("/delete_review_tag/:path_id", { :controller => "review_tags", :action => "destroy" })

  #------------------------------

  # Routes for the Tag resource:

  # CREATE
  post("/insert_tag", { :controller => "tags", :action => "create" })
          
  # READ
  get("/tags", { :controller => "tags", :action => "index" })
  
  get("/tags/:path_id", { :controller => "tags", :action => "show" })
  
  # UPDATE
  
  post("/modify_tag/:path_id", { :controller => "tags", :action => "update" })
  
  # DELETE
  get("/delete_tag/:path_id", { :controller => "tags", :action => "destroy" })

  #------------------------------

  # Routes for the Review comment resource:

  # CREATE
  post("/insert_review_comment", { :controller => "review_comments", :action => "create" })
          
  # READ
  get("/review_comments", { :controller => "review_comments", :action => "index" })
  
  get("/review_comments/:path_id", { :controller => "review_comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_review_comment/:path_id", { :controller => "review_comments", :action => "update" })
  
  # DELETE
  get("/delete_review_comment/:path_id", { :controller => "review_comments", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

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

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Books article resource:

  # CREATE
  post("/insert_books_article", { :controller => "books_articles", :action => "create" })
          
  # READ
  get("/books_articles", { :controller => "books_articles", :action => "index" })
  
  get("/books_articles/:path_id", { :controller => "books_articles", :action => "show" })
  
  # UPDATE
  
  post("/modify_books_article/:path_id", { :controller => "books_articles", :action => "update" })
  
  # DELETE
  get("/delete_books_article/:path_id", { :controller => "books_articles", :action => "destroy" })

  #------------------------------

  # Routes for the Author resource:

  # CREATE
  post("/insert_author", { :controller => "authors", :action => "create" })
          
  # READ
  get("/authors", { :controller => "authors", :action => "index" })
  
  get("/authors/:path_id", { :controller => "authors", :action => "show" })
  
  # UPDATE
  
  post("/modify_author/:path_id", { :controller => "authors", :action => "update" })
  
  # DELETE
  get("/delete_author/:path_id", { :controller => "authors", :action => "destroy" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  post("/insert_review", {:controller => "reviews", :action => "create" })
          
  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })
  
  get("/reviews/:path_id", { :controller => "reviews", :action => "show" })
  
  # UPDATE
  
  post("/modify_review/:path_id", { :controller => "reviews", :action => "update" })
  
  # DELETE
  get("/delete_review/:path_id", { :controller => "reviews", :action => "destroy" })

  #------------------------------

end
