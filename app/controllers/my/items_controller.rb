class My::ItemsController < ApplicationController
  before_filter :require_login

  def index
    @user  = current_user
    @items = current_user.items.all
    @item = Item.new
  end

  def new
    # find a new way without useing .build
    # creates a new item saved in memory that isn't saved to the database, will fuck up a lot of shit.
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.new(params[:item])
    if @item.save
      render @item
    else
      raise 500
    end
    # if @item.save
    #   redirect_to my_items_path, notice: "Item created!"
    # else
    #   render :new
    # end
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
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to my_items_path, notice: "Item remove from inventory!"
  end
end
