require 'spec_helper'

describe API::V1::SessionsController, type: :controller do

  it 'status failed when user doesnt exist' do
    post :create, { user_id: 1 }
    json_resp = JSON.parse(response.body)
    expect(json_resp['status']).to eq('failed')
  end

  it 'status success when user exist' do
    user = User.create(name: 'Voron')
    post :create, { user_id: user.id }
    json_resp = JSON.parse(response.body)
    expect(json_resp['status']).to eq('success')
  end

  it 'successful creation session' do
    user = User.create(name: 'Voron')
    post :create, { user_id: user.id, time: '1 year 5 months 12 days 1 hour 27 minutes 34 seconds' }
    session = Session.first
    expect(session.original_time).to eq('1 year 5 months 12 days 1 hour 27 minutes 34 seconds')
  end

  it 'successful update session' do
    user = User.create(name: 'Voron')
    session = Session.create(user_id: user.id, original_time: '1 year 5 months 12 days 1 hour 27 minutes 34 seconds')
    patch :update, {id: session.id, user_id: user.id, time: '1 year 5 months 12 days 1 hour 27 minutes' }
    expect(session.reload.original_time).to eq('1 year 5 months 12 days 1 hour 27 minutes')
  end

end