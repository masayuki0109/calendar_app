require 'byebug'
require "date"

class Calendar
  def this_month
    'August'
  end

  def day_of_weeks(start_wday = 0)
    day_of_weeks = %w(日 月 火 水 木 金 土)
    weeks = []
    (0..6).each do |i|
      index = (start_wday.to_i + i) % 7
      weeks.push(day_of_weeks[index])
    end
    weeks
  end

  def days(start_wday = 0)
    today = Date.today
    day_of_first_this_month = Date.new(today.year, today.month, 1)
    day_of_last_this_month = Date.new(today.year, today.month, -1)

    month = []
    week = []

    (day_of_first_this_month..day_of_last_this_month).each do |day|
      if day.wday == start_wday
        month.push(week)
        week = []
      end
      week.push(day)
    end
    month.push(week)

    offset = day_of_first_this_month.wday - start_wday
    offset.times do |i|
      month.first.unshift("  ")
    end
    month
  end

  def outputs(start_wday = 0)
    label = day_of_weeks(start_wday).join(" ")
    p label
    weeks = days(start_wday).each do |week|
      week.two_digits
      p week.two_digits.join(" ")
    end
  end
end

class Array
  def two_digits
    new_arr = self.map do |item|
      if item.kind_of?(Date)
        item.day.to_s.rjust(2)
      else
        item.to_s.rjust(2)
      end
    end
    new_arr
  end
end

Calendar.new.outputs
