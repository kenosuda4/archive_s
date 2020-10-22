class SortsController < ApplicationController
  def sort
    selection = params[:keyword]
    @menus = Menu.sort(selection)
  end
end
