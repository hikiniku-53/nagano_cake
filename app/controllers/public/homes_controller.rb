class Public::HomesController < ApplicationController

    def top
        @items = Item.page(params[:page]).per(4)
        @genres = Genre.all
    end

    def about
    end

end
