class SortsController < ApplicationController
  def menu_sort
    selection = params[:keyword]
    @menus = Menu.sort(selection)
    @menus = Kaminari.paginate_array(@menus).page(params[:page])
    @genres = Genre.all
  end

  def user_sort
    selection = params[:keyword]
    @users = User.sort(selection)
    @users = Kaminari.paginate_array(@users).page(params[:page])
    @genres = Genre.all
  end

  def bookmark_sort
    selection = params[:keyword]
    @bookmarks = Bookmark.sort(selection)
    @menus = Kaminari.paginate_array(@bookmarks).page(params[:page])
    @genres = Genre.all
  end
end
