module API::V1
  class User < ActiveRecord::Base
    class Create < Trailblazer::Operation

      include Model
      model User, :create

      contract do
        property :name
        validates :name, presence: true
      end

      def process(params)
        validate(params) do |f|
          f.save
        end
      end
    end

  end
end