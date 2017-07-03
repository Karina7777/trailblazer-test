module API::V1
  class Session < ActiveRecord::Base

    class Create < Trailblazer::Operation
      include Dispatch

      include Model
      model Session, :create

      contract do
        property :original_time
        property :seconds_time
        property :user_id

        validates :user_id, presence: true
        validate :user?

        def user?
          errors.add('user_id', 'not exist') unless User.find_by_id(user_id)
        end
      end


      def process(params)
        validate(params) do |f|
          seconds = TextTimeToSeconds.new(params[:time]).calc_seconds if params[:time]
          session = get_session(params[:id])
          if session
            session.update_attributes(original_time: params[:time], seconds_time: seconds)
          else
            contract.original_time = params[:time]
            contract.user_id = params[:user_id]
            contract.seconds_time = seconds
            contract.save
          end
        end
      end

      def get_session(id)
        Session.find_by_id(id)
      end

    end

    class Update < Create
      self.builder_class = Create.builder_class
      action :update
    end

  end
end