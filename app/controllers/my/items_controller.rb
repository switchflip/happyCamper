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
    @item = current_user.items.new(params[:item])
    if @item.save
      redirect_to my_items_path, notice: "Item created!"
    else
      render :new
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
    if @item.update_attributes(params[:item])
      redirect_to my_items_path, notice: "Item successfully updated!"
    else
      render :new
    end
  end

  def destroy
    @item = Trip.find(params[:id])
    @item.destroy
    rediect_to items_path, notice: "Item remove from inventory!"
  end
end