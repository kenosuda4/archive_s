class SortsController < ApplicationController
  def sort
    selection = params[:keyword]
    @menus = Menu.sort(selection).page(params[:page]).reverse_order
    @genres = Genre.all
  end
end
