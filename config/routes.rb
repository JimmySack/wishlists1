Rails.application.routes.draw do
  # Routes for the Item resource:
  # CREATE
  get "/items/new", :controller => "items", :action => "new"
  post "/create_item", :controller => "items", :action => "create"

  # READ
  get "/items", :controller => "items", :action => "index"
  get "/items/:id", :controller => "items", :action => "show"

  # UPDATE
  get "/items/:id/edit", :controller => "items", :action => "edit"
  post "/update_item/:id", :controller => "items", :action => "update"

  # DELETE
  get "/delete_item/:id", :controller => "items", :action => "destroy"
  #------------------------------

  # Routes for the Wishlist resource:
  # CREATE
  get "/wishlists/new", :controller => "wishlists", :action => "new"
  post "/create_wishlist", :controller => "wishlists", :action => "create"

  # READ
  get "/wishlists", :controller => "wishlists", :action => "index"
  get "/wishlists/:id", :controller => "wishlists", :action => "show"

  # UPDATE
  get "/wishlists/:id/edit", :controller => "wishlists", :action => "edit"
  post "/update_wishlist/:id", :controller => "wishlists", :action => "update"

  # DELETE
  get "/delete_wishlist/:id", :controller => "wishlists", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
