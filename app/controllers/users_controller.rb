class UsersController < ApplicationController
    before_action :require_user, only: [:show]
    def index
    end
    def show
        @user = User.find(params[:id])
    end
    def new
    end
    def create
    end
end