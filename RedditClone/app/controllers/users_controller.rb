class UsersController < ApplicationController

    # before_action :require_logged_in?

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if user
            log_in(user)
            #redirect_to posts_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end



    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end

def new
    @user = User.new
end

def create
    @user = User.new(user_params)

    if @user.save
        log_in(@user)
        redirect_to posts_url
    else
        flash[:errors] = @user.errors.full_messages
        render :new
    end
end