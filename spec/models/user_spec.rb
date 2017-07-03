require 'spec_helper'

describe User, type: :model do

  it 'order users by sum seconds sessions' do
    API::V1::User::Create.({name: 'Voron1'})
    user1 = User.find_by(name: 'Voron1')
    API::V1::User::Create.({name: 'Voron2'})
    user2 = User.find_by(name: 'Voron2')

    API::V1::Session::Create.({user_id: user1.id, time: '1 year'})
    API::V1::Session::Create.({user_id: user1.id, time: '5 months'})

    API::V1::Session::Create.({user_id: user2.id, time: '2 year'})
    API::V1::Session::Create.({user_id: user2.id, time: '6 months'})

    order_by_session = User.order_by_session

    expect(order_by_session.first.name).to eq('Voron2')
    expect(order_by_session.last.name).to eq('Voron1')
  end
end