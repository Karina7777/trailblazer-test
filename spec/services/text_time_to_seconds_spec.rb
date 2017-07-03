require 'spec_helper'

describe TextTimeToSeconds do

  it 'test time results' do
    txttime = TextTimeToSeconds.new('2 year')
    expect(txttime.calc_seconds).to eq(txttime.sec_in_year * 2)

    txttime.text_time = '2 months'
    expect(txttime.calc_seconds).to eq(txttime.sec_in_month * 2)

    txttime.text_time = '2 days'
    expect(txttime.calc_seconds).to eq(txttime.sec_in_day * 2)

    txttime.text_time = '2 hour'
    expect(txttime.calc_seconds).to eq(txttime.sec_in_hour * 2)

    txttime.text_time = '2 seconds'
    expect(txttime.calc_seconds).to eq(2)
  end
end