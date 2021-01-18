require 'date'

class ReportsController < ApplicationController
  def daily
    #get current date to find the current week
    d = DateTime.now
    today = Day.find_by(date_str: d.strftime("%d/%m/%Y"))
    @days = Day.where(week_id: today.week.id).order(:date)
    @dh = DailyHour.where(day: @days)
    teams = Team.all.order(:team)
    @result = {}
    teams.each do |t|
      @result[t.team] = {}
      consultants = Consultant.where(team_id: t.id).order(:name)
      consultants.each do |c|
        @result[t.team][c.name] = {}
        @days.each do |d|
          @result[t.team][c.name][d.date_str] = 0
        end
      end
    end
    @dh.each do |dh|
      @result[dh.consultant.team.team][dh.consultant.name][dh.day.date_str] += dh.hours
    end
  end

  def weekly
  end
end
