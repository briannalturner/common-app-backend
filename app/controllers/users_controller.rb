class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token


    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: {id: user.id, first_name: user.first_name, last_name: user.last_name, company: user.company, phone: {country_code: user.country_code, phone: user.phone} }     
    end

    def update
        user = User.find(params[:id])
        # byebug
        user.update(user_params)
        render json: {id: user.id, first_name: user.first_name, last_name: user.last_name, company: user.company, phone: {country_code: user.country_code, phone: user.phone} }     
    end

    def destroy

        user = User.find(params[:id])
        # byebug
        user.delete

        render json: {message: 'user deleted'}

    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :company, :country_code, :phone)
    end
end
