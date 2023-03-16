class ActivityUsersController < ApplicationController
    before_action :authenticate_user!
    def new
        @activities = Activity.all
        @activity_user = ActivityUser.new
    end 

    def create 
        @activity_user = ActivityUser.new(activity_user_params)
        if @activity_user.save 
            redirect_to :activity_user_index
        else 
            render :activity_user_new
        end 
    end 

    def index
        @activity_users = current_user.activity_users
    end 
    private
        def activity_user_params 
            params.require(:activity_user).permit(:duration,:date)
        end
end
