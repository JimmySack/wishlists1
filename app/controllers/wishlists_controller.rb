class WishlistsController < ApplicationController
  before_action :current_user_must_be_wishlist_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_wishlist_user
    wishlist = Wishlist.find(params[:id])

    unless current_user == wishlist.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Wishlist.ransack(params[:q])
    @wishlists = @q.result(:distinct => true).includes(:user, :items).page(params[:page]).per(10)

    render("wishlists/index.html.erb")
  end

  def show
    @item = Item.new
    @wishlist = Wishlist.find(params[:id])

    render("wishlists/show.html.erb")
  end

  def new
    @wishlist = Wishlist.new

    render("wishlists/new.html.erb")
  end

  def create
    @wishlist = Wishlist.new

    @wishlist.name = params[:name]
    @wishlist.date = params[:date]
    @wishlist.user_id = params[:user_id]

    save_status = @wishlist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/wishlists/new", "/create_wishlist"
        redirect_to("/wishlists")
      else
        redirect_back(:fallback_location => "/", :notice => "Wishlist created successfully.")
      end
    else
      render("wishlists/new.html.erb")
    end
  end

  def edit
    @wishlist = Wishlist.find(params[:id])

    render("wishlists/edit.html.erb")
  end

  def update
    @wishlist = Wishlist.find(params[:id])

    @wishlist.name = params[:name]
    @wishlist.date = params[:date]
    @wishlist.user_id = params[:user_id]

    save_status = @wishlist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/wishlists/#{@wishlist.id}/edit", "/update_wishlist"
        redirect_to("/wishlists/#{@wishlist.id}", :notice => "Wishlist updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Wishlist updated successfully.")
      end
    else
      render("wishlists/edit.html.erb")
    end
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])

    @wishlist.destroy

    if URI(request.referer).path == "/wishlists/#{@wishlist.id}"
      redirect_to("/", :notice => "Wishlist deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Wishlist deleted.")
    end
  end
end
