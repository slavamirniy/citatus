class QuoutesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

    def create
        @micropost = current_user.quoutes.build(quoute_params)
        if @micropost.save
        flash[:success] = "Зацитировано!"
        redirect_to root_url
        else
        @feed_items = []
        render 'static_pages/home'
        end
    end

    def show
        @quoute = Quoute.find_by(id: params[:id])
    end

    def destroy
        @quoute.destroy
        flash[:success] = "Стёрто навсегда!"
        redirect_to request.referrer || root_url
    end

    private

    def correct_user
        @quoute = current_user.quoutes.find_by(id: params[:id])
        redirect_to root_url if @quoute.nil?
    end

    def quoute_params
        params.require(:quoute).permit(:content, :author)
    end
end
