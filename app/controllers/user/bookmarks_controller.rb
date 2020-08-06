class User::BookmarksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_bookmark, only: [:create, :destroy]
    
    def index
        @menus = Menu.all
        @bookmarks = current_user.bookmarks_menus.includes(:user).page(params[:page]).reverse_order
    end

    def create
        user = current_user
        menu = Menu.find(params[:menu_id])
        bookmark = Bookmark.create(user_id: user.id, menu_id: menu.id)
    end
    def destroy
        user = current_user
        menu = Menu.find(params[:menu_id])
        bookmark = Bookmark.find_by(user_id: user.id, menu_id: menu.id)
        bookmark.destroy
    end

private
    def set_bookmark
        @menu = Menu.find(params[:menu_id])
    end

end
