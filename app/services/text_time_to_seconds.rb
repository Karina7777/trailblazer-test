class TextTimeToSeconds

  attr_accessor :text_time

  def initialize(text_time)
    @text_time = text_time
  end

  def get_amount_by_time_name(time_name)
    @text_time.match(/(\d+)\s#{time_name}/s).try(:[], 1) || 0
  end

  def calc_seconds
    amount_year = get_amount_by_time_name('year').to_i
    amount_month = get_amount_by_time_name('months').to_i
    amount_day = get_amount_by_time_name('days').to_i
    amount_hour = get_amount_by_time_name('hour').to_i
    amount_second = get_amount_by_time_name('seconds').to_i
    amount_year * sec_in_year + amount_month * sec_in_month + amount_day * sec_in_day + amount_hour * sec_in_hour + amount_second
  end

  def sec_in_year
    31536000
  end

  def sec_in_month
    2628000
  end

  def sec_in_day
    86400
  end

  def sec_in_hour
    3600
  end

end