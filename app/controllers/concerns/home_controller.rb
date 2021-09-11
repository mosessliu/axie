class HomeController < ApplicationController
  Row = Struct.new(:scholar, :slp_total, :slp_delta, :last_tracked_at)

  def index
    GetSlpService.new.run if get_records?

    @rows = rows
  end

  private

  def get_records?
    return true if SlpLog.count == 0

    last_log = SlpLog.last
    cutoff_time = '10:00 AM PDT'

    no_logs_today_yet = last_log.created_at <= Time.zone.today
    past_cutoff = Time.zone.now >= DateTime.parse(cutoff_time).utc

    no_logs_today_yet && past_cutoff
  end

  def rows
    Scholar.includes(:slp_logs).map do |scholar|
      logs = scholar.slp_logs.last(2)

      if logs.empty?
        Row.new(scholar, 0, 0, nil)
      elsif logs.count == 1
        Row.new(scholar, logs.first, 0, nil)
      else
        total = logs[1].total
        delta = logs[1].total - logs[0].total

        last_tracked_at = logs[1].created_at.in_time_zone("Pacific Time (US & Canada)")
        last_tracked_at_display = last_tracked_at.strftime('%-m/%-d/%Y %I:%M%p')

        Row.new(scholar, total, delta, last_tracked_at_display)
      end
    end
  end
end