class User < ApplicationRecord
  has_many :sessions

  scope :order_by_session, -> { includes(:sessions).order('sessions.seconds_time desc') }

end
