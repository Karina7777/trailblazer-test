module API::V1
  class SessionsController < ApplicationController

    def create
      begin
        API::V1::Session::Create.(session_params)
      rescue
        respond = { status: 'failed'}
      end
      respond ||= { status: 'success'}
      render json: respond
    end

    def show
      sessions = Sessions.where(user_id: params[:user_id])
      render :json => sessions
    end

    def update
      begin
        API::V1::Session::Update.(session_params)
      rescue
        respond = { status: 'failed'}
      end
      respond ||= { status: 'success'}
      render json: respond
    end

  private

    def session_params
      params.permit(:id, :user_id, :time)
    end

  end
end