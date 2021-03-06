# encoding: utf-8

module Nanoc3::Extra::TimeExtensions

  # Returns a string with the time in an ISO-8601 date format.
  def to_iso8601_date
    self.strftime("%Y-%m-%d")
  end

  # Returns a string with the time in an ISO-8601 time format.
  def to_iso8601_time
    self.gmtime.strftime("%Y-%m-%dT%H:%M:%SZ")
  end

end

class Time
  include Nanoc3::Extra::TimeExtensions
end
