class My::ItemsController < ApplicationController
  before_filter :require_login

  def index
    @user  = current_user
    @items = current_user.items.all
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = Item.new(params[:id])
    @item.users << current_user
    if @trip.save
      rediect_to_items_path, notice: "Item created!"
    else
      else render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if item.update_attributes(params[:item])
      redirect_to_my_items_path, notice: "Item successfully updated!"
    else
      render :new
    end
  end

  def destroy
    @item = Trip.find(params[:id])
    @item.destroy
    rediect_to_items_path, notice: "Item remove from inventory!"
  end
end
