class Public::HomesController < ApplicationController

    def top
        
        @items = Item.order("id DESC").page(params[:page]).per(4)
        @genres = Genre.all
    end

    def about
    end

end
