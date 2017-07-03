require 'spec_helper'
require 'byebug'

describe API::V1::UsersController, type: :controller do

  describe '.POST' do
    it 'status success when name is present' do
      post :create, { name: 'Voron' }
      json_resp = JSON.parse(response.body)
      expect(json_resp['status']).to eq('success')
    end

    it 'status failed when name is not present' do
      post :create
      json_resp = JSON.parse(response.body)
      expect(json_resp['status']).to eq('failed')
    end
  end
end