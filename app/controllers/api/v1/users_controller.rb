module API::V1
  class UsersController < ApplicationController

    def index
      users = User.includes(:sessions).group(:id, :name).sum(:seconds_time)
      render :json => users
    end

    def create
      begin
        API::V1::User::Create.(user_params)
      rescue
        respond = { status: 'failed'}
      end
      respond ||= { status: 'success'}
      render json: respond
    end

  private

    def user_params
      params.permit(:name)
    end

  end
end