class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        #binding.pry
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if session[:user_id] == @user.id
            render :show
        else
            redirect_to '/'
        end
    end

    def signin
    end

    def login
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :signin
        end

    end

    def logout
        session.clear
        redirect_to '/'
    end

    

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end
